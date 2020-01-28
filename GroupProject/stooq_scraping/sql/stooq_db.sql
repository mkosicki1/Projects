create database python_db;
use python_db;

#create user 'python_user'@'localhost' identified by 'kosa22d';


#grant INSERT, SELECT, DELETE, UPDATE
	on python_db.*
    to 'python_user'@'localhost';

create table stooq(

		stooq_id int primary key auto_increment,
        title text not null,
        content longtext not null,
        date_added varchar(55) not null,
        status bool default 0
        );
        
        
 # zmiana w dacie varchar(55) na datetime;

alter table stooq
		modify date_added datetime not null;       
        
        
drop table stooq;