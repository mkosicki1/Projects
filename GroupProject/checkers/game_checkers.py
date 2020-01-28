

class Warcaby:
    # pole klasowe -> słownik zawierający 8 słowników
    warcaby = {
        8: {1: "_", 2: "O", 3: "_", 4: "O", 5: "_", 6: "O", 7: "_",8: "O"},
        7: {1: "O", 2: "_", 3: "O", 4: "_", 5: "O", 6: "_", 7: "O",8: "_"},
        6: {1: "_", 2: "O", 3: "_", 4: "O", 5: "_", 6: "O", 7: "_",8: "O"},
        5: {1: "_", 2: "_", 3: "_", 4: "_", 5: "_", 6: "_", 7: "_",8: "_"},
        4: {1: "_", 2: "_", 3: "_", 4: "_", 5: "_", 6: "_", 7: "_",8: "_"},
        3: {1: "X", 2: "_", 3: "X", 4: "_", 5: "X", 6: "_", 7: "X",8: "_"},
        2: {1: "_", 2: "X", 3: "_", 4: "X", 5: "_", 6: "X", 7: "_",8: "X"},
        1: {1: "X", 2: "_", 3: "X", 4: "_", 5: "X", 6: "_", 7: "X",8: "_"}
    }

    # metoda klasowa wypisująca szachownicę
    def printBoard(self):
        # iteracja po sekwencji wierszy
        print("  | %1s | %1s | %1s | %1s | %1s | %1s | %1s | %1s |  " % ("A", "B", "C", "D", "E", "F", "G", "H"))
        for row in self.warcaby.keys():
            # iteracja po polach w wierszu
            print("%1d " % (row), end="")
            for key in self.warcaby[row].keys():
                print("| %1s " % (self.warcaby[row][key]), end="")
            print("| %1d \n" % (row), end="")
        print("  | %1s | %1s | %1s | %1s | %1s | %1s | %1s | %1s |  " % ("A", "B", "C", "D", "E", "F", "G", "H"))

    def getPoint(self):
        print(self.warcaby[3][3])

    def checkMoveFromTo(self, rowStart, columnStart, rowStop, columnStop, type):
        # sprawdzam czy punkty znajdują się w kluczach naszych słowników
        if(rowStart in self.warcaby.keys() and columnStart in self.warcaby[rowStart].keys()
                and (self.warcaby[rowStart][columnStart] == "X" or self.warcaby[rowStart][columnStart] == "O")):
            # sprawdzenie poprawności ruchu pionka X
            if(type == "X" and rowStop == (rowStart + 1)
                    and (columnStop == (columnStart + 1) or (columnStop == (columnStart - 1)))
                    and columnStop >= 1 and columnStop <= 8 and rowStop >= 1 and rowStop <=8):
                self.movePoint(rowStart,columnStart,rowStop,columnStop,type)    # wywołanie metody klasowej
            # sprawdzenie poprawności ruchu pionka O
            elif(type == "O" and rowStop == (rowStart - 1)
                    and (columnStop == (columnStart + 1) or (columnStop == (columnStart - 1)))
                    and columnStop >= 1 and columnStop <= 8 and rowStop >= 1 and rowStop <= 8):
                self.movePoint(rowStart, columnStart, rowStop, columnStop, type)
            else:
                print("Błędny ruch")
        else:
            print("błędny adres pionka")

    def movePoint(self, rowStart, columnStart, rowStop, columnStop, type):
        # Przesunięcie pionka na nową pozycję
        self.warcaby[rowStop][columnStop] = type
        # aktualizacja pustego miejsca pozostałego po pionku
        self.warcaby[rowStart][columnStart] = "_"
        self.printBoard()

w1 = Warcaby()
w1.printBoard()
w1.getPoint()
w1.checkMoveFromTo(3,1,4,2,"X")
w1.checkMoveFromTo(4,2,5,1,"X")
w1.checkMoveFromTo(4,4,5,5,"X")