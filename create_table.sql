set feedback on
prompt creating tables ...
set feedback on


create table players (
	name varchar(20) primary key,
	birthdate date,
	shirtNumber number(2),
	team varchar(20) not null
);

	

set feedback on
prompt creating tables ...
set feedback on


create table players (
	name varchar(20) primary key,
	birthdate date,
	shirtNumber number(2),
	team varchar(20) not null
);

	

create table officials (
	staffID NUMBER(2) primary key,
	name varchar(20),
	address varchar(20),
	birthdate date,
	staysAt varchar(20) not null,
	checkIn date,
	checkOut date
);

create table hotels(
	name varchar(20) primary key,
	rooms integer check (rooms > 0),
	address varchar(20),
	manager number(2) not null
		references officials(staffID)
		initially deferred deferrable
);

create table teams (
	name varchar(20) primary key,
	staysAt varchar(20) not null
		references hotels(name),
	checkIn date,
	checkOut date,
	captain varchar(20) not null
		references players(name)
		initially deferred deferrable
);


create table stadiums(
	name varchar(20) primary key,
	capacity integer check (capacity > 0),
	city varchar(20)
);

create table fans(
	name varchar(20) primary key,
	birthdate date,
	staysAt varchar(20)
		references hotels(name),
	checkIn date,
	checkOut date,
	autographs number(2)
);

--set feedback on;
create table matches (
	ID integer primary key,
	datePlayed date,
	home varchar(20) not null
		references teams(name),
	score_home number(2) not null,
	away varchar(20) not null
		references teams(name),
	score_away number(2) not null,
	stadium varchar(20) not null
		references stadiums(name),
	referee Number(2) not null
		references officials(staffID),
	manOfMatch varchar(20) not null
		references players(name),
	check (home <> away)
);
	

create table favStadiums(
	player varchar(20)
		references players(name),
	stadium varchar(20)
		references stadiums(name),
	primary key (player,stadium)
);



create table favTeams(
	fan varchar(20)
		references fans(name),
	team varchar(20)
		references teams(name),
	primary key (fan,team)
);


create table favPlayers(
	fan varchar(20)
		references fans(name),
	player varchar(20)
		references players(name),
	primary key (fan,player)
);

create table autographs(
	fan varchar(20)
		references fans(name),
	player varchar(20)
		references players(name),
	stadium varchar(20)
		references stadiums(name),
	dateTaken date,
	primary key (fan,player)
);

create table medicalServices(
	team varchar(20)
		references teams(name),
	official number(2)
		references officials(staffID),
	primary key (team,official)
);


Alter table players add foreign key (team) 
	references teams(name) initially deferred deferrable;

Alter table officials add foreign key (staysAt)
	references hotels(name) initially deferred deferrable;


--  Q2 and Q3

create table Q2(
	name varchar(20),
	stadium varchar(20),
	matchid number
);
create table Q3 (
	rank number(2),
	name VARCHAR(20),
	played number(2),
	won number(2),
	drawn number(2),
	lost number(2),
	gf number(2),
	ga number(2),
	gd number(2),
	points number(2)
);



-- Expected results

create table Q2_EXPECTED(
	name varchar(20),
	stadium varchar(20),
	matchid number
);

insert into Q2_EXPECTED values ('Bryan','Exies',11);
insert into Q2_EXPECTED values ('Bryan','White City',15);
insert into Q2_EXPECTED values ('Coelho','-',0);
insert into Q2_EXPECTED values ('Delic','Acer Arena',14);
insert into Q2_EXPECTED values ('Greul','-',0);
insert into Q2_EXPECTED values ('Hanley','-',0);
insert into Q2_EXPECTED values ('Arthurs','-',0);
insert into Q2_EXPECTED values ('Kubot','Acer Arena',25);
insert into Q2_EXPECTED values ('Santoro','-',0);
insert into Q2_EXPECTED values ('Healey','Exies',16);
insert into Q2_EXPECTED values ('Andreev','-',0);
insert into Q2_EXPECTED values ('Johansson','-',0);
insert into Q2_EXPECTED values ('Dlouhy','-',0);
insert into Q2_EXPECTED values ('Rochus','-',0);
insert into Q2_EXPECTED values ('Becker','Coopers',8);
insert into Q2_EXPECTED values ('Friedl','Coopers',20);
insert into Q2_EXPECTED values ('Peya','-',0);
insert into Q2_EXPECTED values ('Pavel','Acer Arena',19);
insert into Q2_EXPECTED values ('Ramirez','-',0);
insert into Q2_EXPECTED values ('Almagro','-',0);
insert into Q2_EXPECTED values ('Erlich','Acer Arena',24);
insert into Q2_EXPECTED values ('Aspelin','-',0);
insert into Q2_EXPECTED values ('Kim','-',0);
insert into Q2_EXPECTED values ('Bill','Ballymore',12);
insert into Q2_EXPECTED values ('Jimmy','-',0);
insert into Q2_EXPECTED values ('Robert','-',0);
insert into Q2_EXPECTED values ('Shaun','-',0);





create table Q3_EXPECTED (
	rank number(2),
	name VARCHAR(20),
	played number(2),
	won number(2),
	drawn number(2),
	lost number(2),
	gf number(2),
	ga number(2),
	gd number(2),
	points number(2)
);

insert into Q3_EXPECTED values (1,'Aston Villa',5,2,2,1,8,6,2,8);
insert into Q3_EXPECTED values (2,'Liverpool',6,2,2,2,8,7,1,8);
insert into Q3_EXPECTED values (3,'Everton',4,2,1,1,5,5,0,7);
insert into Q3_EXPECTED values (4,'Manchester United',3,2,0,1,4,7,-3,6);
insert into Q3_EXPECTED values (5,'Southampton',4,2,0,2,6,6,0,6);
insert into Q3_EXPECTED values (6,'Nottingham Forest',5,1,3,1,10,7,3,6);
insert into Q3_EXPECTED values (7,'Chelsea',5,1,3,1,7,10,-3,6);
insert into Q3_EXPECTED values (8,'Tottenham Hotspur',4,1,2,1,8,6,2,5);
insert into Q3_EXPECTED values (9,'Blackburn Rovers',4,1,2,1,10,9,1,5);
insert into Q3_EXPECTED values (10,'Ipswich Town',5,1,2,2,5,6,-1,5);
insert into Q3_EXPECTED values (11,'Sunderland',5,1,2,2,4,5,-1,5);
insert into Q3_EXPECTED values (12,'Norwich City',4,1,1,2,7,8,-1,4);
insert into Q3_EXPECTED values (13,'Real Madrid',0,0,0,0,0,0,0,0);





create table Q4_EXPECTED(
	name varchar(20),
	birthdate date,
	staysAt varchar(20),
	checkIn date,
	checkOut date,
	autographs number(2)
);

insert into Q4_EXPECTED values ('Aidan','22-Nov-2001','Ambassador','16-Aug-2007','23-Aug-2007',0);
insert into Q4_EXPECTED values ('Caden','12-Sep-1976','Lorne','11-Aug-2007','21-Aug-2007',0);
insert into Q4_EXPECTED values ('Riley','14-Mar-2972','Royal','15-Aug-2007','23-Aug-2007',4);
insert into Q4_EXPECTED values ('Caleb','22-Dec-1988','Ambassador','16-Aug-2007','24-Aug-2007',NULL);
insert into Q4_EXPECTED values ('Hannah','21-Mar-1998','Lorne','11-Aug-2007','23-Aug-2007',NULL);
insert into Q4_EXPECTED values ('Emma','21-Mar-1998','Lorne','11-Aug-2007','23-Aug-2007',NULL);
insert into Q4_EXPECTED values ('Dlouhy','21-Mar-1998','Ambassador','11-Aug-2007','23-Aug-2007',NULL);
insert into Q4_EXPECTED values ('Grace','11-Sep-1976','Royal','12-Aug-2007','23-Aug-2007',1);
insert into Q4_EXPECTED values ('Ella','12-mar-1982',NULL,NULL,NULL,0);
insert into Q4_EXPECTED values ('Cadence','11-Sep-1934',NULL,NULL,NULL,0);
