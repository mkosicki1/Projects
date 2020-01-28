create database notowania 
 default character set utf8
 collate utf8_polish_ci;
 
 
 
 use notowania;
 
 grant INSERT, SELECT, DELETE, UPDATE 
	on python_db.* 
    to 'python_user'@'localhost';

create table WIG_20(

		wig_20_id int primary key auto_increment,
        name_index text not null,
        ticker text not null,
        kurs double(6,2) not null,
		zmiana double(6,2) not null,
		zmiana_pr double(6,2) not null,
		wplyw_na_indeks double(6,2) not null,
        udział_w_obrocie double(6,4) not null,
        pakiet int not null,
        udział_portfel double(6,2) not null
        );
 
 
 select *
 from wig_20;
 
 create table WIG(

		wig_id int primary key auto_increment,
        name_index text not null,
        ticker text not null,
        kurs double(6,2) not null,
		zmiana double(6,2) not null,
		zmiana_pr double(6,2) not null,
		wplyw_na_indeks double(6,2) not null,
        udział_w_obrocie double(6,4) not null,
        pakiet int not null,
        udział_portfel double(6,2) not null
        );
 
 
 select *
 from wig;
 
 
 create table WIG_30(

		wig_30_id int primary key auto_increment,
        name_index text not null,
        ticker text not null,
        kurs double(6,2) not null,
		zmiana double(6,2) not null,
		zmiana_pr double(6,2) not null,
		wplyw_na_indeks double(6,2) not null,
        udział_w_obrocie double(6,4) not null,
        pakiet int not null,
        udział_portfel double(6,2) not null
        );
 
 
 select *
 from wig_30;
 
 
 create table mWIG_40(

		mwig_40_id int primary key auto_increment,
        name_index text not null,
        ticker text not null,
        kurs double(6,2) not null,
		zmiana double(6,2) not null,
		zmiana_pr double(6,2) not null,
		wplyw_na_indeks double(6,2) not null,
        udział_w_obrocie double(6,4) not null,
        pakiet int not null,
        udział_portfel double(6,2) not null
        );
 
 
 select *
 from mwig_40;
 
 create table mWIG_40(

		mwig_40_id int primary key auto_increment,
        name_index text not null,
        ticker text not null,
        kurs double(6,2) not null,
		zmiana double(6,2) not null,
		zmiana_pr double(6,2) not null,
		wplyw_na_indeks double(6,2) not null,
        udział_w_obrocie double(6,4) not null,
        pakiet int not null,
        udział_portfel double(6,2) not null
        );
 
 
 select *
 from mwig_40;
 
  create table sWIG_80(

		swig_80_id int primary key auto_increment,
        name_index text not null,
        ticker text not null,
        kurs double(6,2) not null,
		zmiana double(6,2) not null,
		zmiana_pr double(6,2) not null,
		wplyw_na_indeks double(6,2) not null,
        udział_w_obrocie double(6,4) not null,
        pakiet int not null,
        udział_portfel double(6,2) not null
        );
 
 
 select *
 from swig_80;