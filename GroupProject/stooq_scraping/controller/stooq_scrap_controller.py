import re
from bs4 import BeautifulSoup
import stooq_scraping.sql.db_credentials as secret
import requests
import pymysql



def toExport():
    connection = pymysql.connect(
        host=secret.host,
        user=secret.username,
        password=secret.password,
        db=secret.database_name,
        charset='utf8',
        port=3305
    )
    print("...CONNECTED...")
    cursor = connection.cursor()
    return connection, cursor

class StooqScrappingController:
    def __init__(self):
        # wykonanie żądania metodą GET na adres url -> obiekt strony
        stooq_page = requests.get("https://stooq.pl/n/?s=2&p=4+22&c=0")
        # na zwróconym obiekcie strony parsujemy do formatu html
        self.stooq_html = BeautifulSoup(stooq_page.content, 'html.parser')
        # połącznie z DB
        db = toExport()
        self.connection = db[0]
        self.cursor = db[1]


    # metoda dodajaca skrapowane dane do tabeli DB
    def insertDataIntoDB(self,i):
        self.cursor.execute("INSERT INTO stooq VALUES (default, %s,%s,%s, default)",
                            (self.result[0][i], self.result[3][i-1], self.result[1][i]))
        self.connection.commit()


    # METODA USUWAJACA CALA ZAWARTOSC TABELI
    def deleteDataFromStooq(self):
        self.cursor.execute("DELETE FROM stooq")
        self.connection.commit()

    def filterDateAndTitleAndUrl(self):
        date_pattern = re.compile(".{3}, [0-9]{1,2} .{3}, [0-9]{1,2}:[0-9]{1,2}")
        title_pattern = re.compile("^.{20,}$")
        urlPattern = re.compile("^https:\/\/stooq.pl\/n\/\?f=.*")
        # pobieramy dane z znaczników tr
        rows = self.stooq_html.find_all("tr")
        # [titles , dates, links, content]
        self.result = [[], [], [], []]




        for index, row in enumerate(rows):
            # filtrowanie daty
            try:
                url = "https://stooq.pl/"+ str(row.a['href'])
                if(re.search(urlPattern, url)):
                    self.result[2].append(url)
            except:
                pass
            date = str(row.find("td", {"id": "f13"})).replace('<td id="f13" nowrap="">', "").replace("</td>", "")
            if (len(str(row.a).split(">")) > 1):
                title = str(row.a).split(">")[1].replace("</a","")
                # szukanie tylko dat zgodnych z regexp
                if(re.search(date_pattern, date) is not None):
                    self.result[1].append(date)
                # szukamt tylko tytułów zgodnych z regexp
                if(re.search(title_pattern,title) is not None and title[0:4] != "<img"):
                    self.result[0].append(title)
                if(title[0:4] == "<img"):
                    title = "obrazek"
                    self.result[0].append(title)


    def getContentByUrl(self, url):
        content_page = requests.get(url)
        content_html = BeautifulSoup(content_page.content, 'html.parser')

        content = content_html.find_all("font", attrs={"id" : "f13"}) #szukamy znacznika font z parametrem f13
        filtered_content = list(content)[2]
        filtered_content = str(filtered_content).split("<br/><br/><br/>")[1].split("<p>")
        result = ""
        for sentence in filtered_content[0:len(filtered_content)-1]:
            result += sentence + " "
        self.result[3].append(result)
        return result



    def getDateAndTitle(self):
        for i, value in enumerate(self.result[1]):
            if i > 0:
                self.result[1][i] = self.changeFormatData(self.result[1][i])
                print(self.result[0][i]) # tytuły
                print(self.result[1][i]) # daty
                print(self.result[2][i]) # linki
                self.getContentByUrl(self.result[2][i])
                print(self.result[3][i-1])
                #zapisanie rekordow w db
                self.insertDataIntoDB(i)

    def changeFormatData(self, oldDate):
        monthNameConv = {
            "sty" : "01", "lut" : "02", "mar" : "03", "kwi" : "04", "maj" : "05", "cze" : "06",
            "lip" : "07", "sie" : "08", "wrz" : "09", "paź" : "10", "lis" : "11", "gru" : "12"
            }
        oldDate = oldDate[5:] # odcięcie nazwy dnia tygodnia
        oldDate = str(oldDate).split(" ") # podział daty po spacji
        day = oldDate[0]
        month = monthNameConv[oldDate[1].replace(",", "")] # konwersja nazwy miesiaca na decimal
        hours_minutes = oldDate[2]
        import datetime
        newDate = str(datetime.datetime.today().year) +"-"+month+"-"+str(day).zfill(2)+" "+hours_minutes
        print(oldDate, newDate)
        return newDate



ssc = StooqScrappingController()
# ssc.deleteDataFromStooq()
ssc.filterDateAndTitleAndUrl()
ssc.getDateAndTitle()
