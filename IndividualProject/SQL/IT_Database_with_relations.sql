## Baza danych szkolenia z relacjami

create database Reaktor
 default character set utf8
 collate utf8_polish_ci;
 
 use reaktor;
 
 
        
CREATE TABLE dane (
		daneID INT primary key auto_increment,
        szkolenieID  INT , 
        pracownikID INT,
        miejscowosc_szkoleniaID INT,
        klientID INT,
        ilosc_osob INT NOT NULL,
        gender enum('M', 'K'),
        data_wystawienia_faktury date not null,
        data_zaplaty date not null,
        data_szkolenia date not null,
        foreign key(szkolenieID) references szkolenia(szkolenieID),
		foreign key(pracownikID) references pracownicy(pracownikID),
        foreign key(miejscowosc_szkoleniaID) references miejscowosci(miejscowoscID),
        foreign key(klientID) references klienci(klientID) );
        
CREATE TABLE klienci (
		klientID INT PRIMARY KEY auto_increment,
        imie varchar(60) not null,
        nazwisko varchar(60) not null,
        miejscowosc varchar(60) not null);
        
        
CREATE TABLE miejscowosci (
		miejscowoscID INT primary KEY auto_increment,
        miejscowosc varchar(50) not null,
        wojewodztwo varchar(50) not null);
        
        
CREATE TABLE pracownicy (
		pracownikID INT primary KEY auto_increment,
        imie varchar(60) not null,
        nazwisko varchar(60) not null);
        
CREATE TABLE szkolenia (
		szkolenieID INT PRIMARY key auto_increment,
        nazwa_szkolenia varchar(100) NOT NULL,
        cena_brutto real not null);


INSERT INTO szkolenia(nazwa_szkolenia, cena_brutto) VALUES('Java Developer', 9840);
INSERT INTO szkolenia(nazwa_szkolenia, cena_brutto) VALUES('Analityk Danych', 6888);
INSERT INTO szkolenia(nazwa_szkolenia, cena_brutto) VALUES('Python Developer', 5535);
INSERT INTO szkolenia(nazwa_szkolenia, cena_brutto) VALUES('Front-End Developer', 5535);
INSERT INTO szkolenia(nazwa_szkolenia, cena_brutto) VALUES('Kurs Mysql', 2970);
INSERT INTO szkolenia(nazwa_szkolenia, cena_brutto) VALUES('Zrozumieć programistę',  3936);


INSERT INTO pracownicy(imie, nazwisko) VALUES('Mario', 'Burczek');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Rob', 'Wąsek');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Aga', 'Syta');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Majkel', 'Kruczek');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Jaś', 'Potworek');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Sam', 'Wybrał');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Pawcio', 'Samuraj');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Martin', 'Warzecha');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Karol', 'Lipka');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Monia', 'Przybyła');
INSERT INTO pracownicy(imie, nazwisko) VALUES('Ernie', 'Krystek');


INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Miro', 'Kosa', 'Warszawa');
INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Maciek', 'Mucha', 'Sochaczew');
INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Karol', 'Kubański', 'Skierniewice');
INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Endriu', 'Commerce', 'Grodzisk Mazowiecki');
INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Piter', 'Jeleń', 'Pakość');
INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Robson', 'Ideowy', 'Płock');
INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Jarosława', 'Kaczyńska', 'Płońsk');
INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Protazja', 'Duda', 'Ostroróg');
INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Gwisław', 'Śmiech', 'Łańcut');
INSERT INTO klienci(imie, nazwisko, miejscowosc) VALUES('Krzywosąd', 'Bereta', 'Szubin');



INSERT INTO miejscowosci(miejscowosc, wojewodztwo) VALUES('Warszawa', 'Mazowieckie');
INSERT INTO miejscowosci(miejscowosc, wojewodztwo) VALUES('Sochaczew', 'Mazowieckie');
INSERT INTO miejscowosci(miejscowosc, wojewodztwo) VALUES('Skierniewice', 'Łódzkie');
INSERT INTO miejscowosci(miejscowosc, wojewodztwo)VALUES('Grodzisk Mazowiecki', 'Mazowieckie');
INSERT INTO miejscowosci(miejscowosc, wojewodztwo) VALUES('Pakość', 'Kujawsko-pomorskie');
INSERT INTO miejscowosci(miejscowosc, wojewodztwo) VALUES('Płock', 'Mazowieckie');
INSERT INTO miejscowosci(miejscowosc, wojewodztwo) VALUES('Płońsk', 'Mazowieckie');
INSERT INTO miejscowosci(miejscowosc, wojewodztwo) VALUES('Ostroróg', 'Wielkopolskie');
INSERT INTO miejscowosci(miejscowosc, wojewodztwo) VALUES('Łańcut', 'Podkarpackie');
INSERT INTO miejscowosci(miejscowosc, wojewodztwo) VALUES('Szubin', 'Kujawsko-pomorskie');


INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(1, 1, 1, 1, 1, 'M','2019-03-28', '2019-03-14', '2019-03-07');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(1, 2, 1, 1, 2, 'M','2019-10-02', '2019-10-20', '2019-09-22');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(1, 7, 2, 2, 2, 'M','2019-08-04', '2019-08-28', '2019-07-08');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(2, 11, 2, 2, 3, 'M','2019-07-21', '2019-07-31', '2019-07-18');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(2, 5, 3, 3, 4, 'M','2019-12-03', '2019-12-01', '2019-11-10');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(3, 2, 4, 4, 3, 'K','2019-01-13', '2019-12-28', '2019-01-04');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(3, 6, 1, 5, 2, 'K','2019-06-19', '2019-07-19', '2019-06-08');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(4, 2, 1, 6, 4, 'M','2019-05-21', '2014-09-28', '2019-05-09');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(4, 9, 2, 7, 2, 'M','2019-08-28', '2019-08-19', '2019-08-24');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(1, 7, 3, 8, 1, 'M','2019-07-24', '2019-07-25', '2019-06-29');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(5, 9, 5, 9, 2, 'M','2019-10-14', '2019-10-19', '2019-10-06');
INSERT INTO dane(szkolenieID,pracownikID, miejscowosc_szkoleniaID, klientID, ilosc_osob, gender, data_wystawienia_faktury, data_zaplaty, data_szkolenia) VALUES(6, 3, 6, 10, 1, 'M','2019-03-19', '2019-04-09', '2019-03-16');



select * from reaktor.dane;
select * from reaktor.szkolenia;
select * from reaktor.klienci;
select * from reaktor.miejscowosci;
select * from reaktor.pracownicy;

        
 
 
 