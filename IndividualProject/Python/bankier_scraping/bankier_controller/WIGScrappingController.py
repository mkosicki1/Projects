import requests
from bs4 import BeautifulSoup
import pymysql

def toExport():
    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='shadow22d',
        db='notowania',
        charset='utf8',
        port=3305
    )
    print("...CONNECTED...")
    cursor = connection.cursor()
    return connection, cursor

class WIG_ScrappingController:
    def __init__(self):
        # wykonanie żądania metodą GET na adres url -> obiekt strony
        wig_page = requests.get("https://www.bankier.pl/inwestowanie/profile/quote.html?symbol=WIG")
        # na zwróconym obiekcie strony parsujemy do formatu html
        self.wig_html = BeautifulSoup(wig_page.content, 'html.parser')
        # połącznie z DB
        db = toExport()
        self.connection = db[0]
        self.cursor = db[1]

    # metoda dodajaca skrapowane dane do tabeli DB
    def insertDataIntoDB(self,results):
        for result in results:
            self.cursor.execute("INSERT INTO WIG VALUES (default, %s,%s,%s,%s,%s,%s,%s,%s,%s)",
                                (result[0], result[1], result[2],result[3],
                                result[4], result[5], result[6], result[7],
                                result[8]))
        self.connection.commit()
        print('...done...')
        # METODA USUWAJACA CALA ZAWARTOSC TABELI

    def deleteDataFromWIG(self):
        self.cursor.execute("DELETE FROM WIG")
        self.connection.commit()


    def getContentWIG(self):
        url = "https://www.bankier.pl/inwestowanie/profile/quote.html?symbol=WIG"

        response = requests.get(url)
        soup = BeautifulSoup(response.content, 'html.parser')

        # znalezienie tabeli
        table = soup.find('table', attrs={'class': 'sortTableMixedData'})

        data = []
        # iteracja po wierszach tabeli
        for row in table.findAll('tr'):
            data_row = []
            for i, col in enumerate(row.findAll('td')):
                value = col.text
                value = value.replace('%', '')
                value = value.replace('\xa0', '')
                value = value.replace(',', '.')
                value = value.replace('≈', '')
                value = value.replace('<', '')

                if i > 1:
                    value = float(value)
                if i == 5:
                    value = round(value, 2)
                if i == 6:
                    value = round(value, 2)
                if i == 7:
                    value = int(value)

                data_row.append(value)
            data.append(data_row)

        # for row in data:
        #     print(row)
        return data[1:]





wsc = WIG_ScrappingController()
results = wsc.getContentWIG()
wsc.insertDataIntoDB(results)
