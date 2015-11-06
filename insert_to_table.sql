set termout on;
set feedback on;

insert into Players  values('Bryan','24-Oct-1977',12,'Liverpool');
insert into Players  values('Coelho','21-Mar-1987',11,'Liverpool');
insert into Players  values('Delic','12-Sep-1974',9,'Nottingham Forest');
insert into Players  values('Greul','08-Apr-1970',1,'Nottingham Forest');
insert into Players  values('Hanley','01-Jan-1982',2,'Aston Villa');
insert into Players  values('Arthurs','02-Feb-1983',86,'Aston Villa');
insert into Players  values('Kubot',NULL,77,'Manchester United');
insert into Players  values('Santoro','16-Aug-1985',NULL,'Manchester United');
insert into Players  values('Healey','12-Dec-1988',24,'Southampton');
insert into Players  values('Andreev','11-Oct-1976',12,'Southampton');
insert into Players  values('Johansson','30-Nov-1983',NULL,'Norwich City');
insert into Players  values('Dlouhy','21-Dec-1978',15,'Norwich City');
insert into Players  values('Rochus','17-Feb-1986',11,'Blackburn Rovers');
insert into Players  values('Becker','11-Apr-1980',14,'Blackburn Rovers');
insert into Players  values('Friedl','4-Oct-1950',11,'Everton');
insert into Players  values('Peya','13-Dec-1986',54,'Everton');
insert into Players  values('Pavel','08-Mar-1983',NULL,'Sunderland');
insert into Players  values('Ramirez','09-Aug-1975',11,'Sunderland');
insert into Players  values('Almagro','10-sep-1980',NULL,'Ipswich Town');
insert into Players  values('Erlich','20-Oct-1964',14,'Ipswich Town');
insert into Players  values('Aspelin','11-jan-1970',NULL,'Tottenham Hotspur');
insert into Players  values('Kim','25-Dec-1989',NULL,'Tottenham Hotspur');
insert into Players  values('Bill','22-Mar-1985',42,'Chelsea');
insert into Players  values('Jimmy','21-Mar-1985',42,'Real Madrid');
insert into Players  values('Robert','23-Mar-1985',42,'Real Madrid');
insert into Players  values('Shaun','12-Nov-1980',21,'Chelsea');

insert into officials values(1,'James','Sydney','23-Sep-1953','Ambassador',NULL,NULL);
insert into officials values(2,'Andrew','Perth','12-Nov-1980','Albany','19-Aug-2007','22-Aug-2007');
insert into officials values(3,'Dlouhy','Canberra','09-Aug-1976','Ambassador','17-Aug-2007','19-Aug-2007');
insert into officials values(4,'Gregory','Adelaide','08-Mar-1965','Ambassador','18-Aug-2007','23-Aug-2007');
insert into officials values(5,'James','Brisbane','18-Aug-1957','Lorne','17-Aug-2007','29-Aug-2007');
insert into officials values(6,'Dlouhy','Melbourne','12-Mar-1986','Ambassador','16-Aug-2007','28-Aug-2007');
insert into officials values(7,'Fiacht','Sydney','11-Dec-1983','Ambassador','12-Aug-2007','17-Aug-2007');
insert into officials values(8,'Martin',NULL,'14-Apr-1976','Albany','17-Aug-2007','23-Aug-2007');

insert into hotels values('Ambassador',400,'Sydney',5);
insert into hotels values('Albany',200,'Perth',2);
insert into hotels values('Royal',150,'Sydney',7);
insert into hotels values('Lorne',250,'Sydney',4);




insert into stadiums values('Acer Arena',17471,'Sydney');
insert into stadiums values('Ballymore',18000,'Brisbane');
insert into stadiums values('Telstra Stadium',18000,'Brisbane');
insert into stadiums values('Melbourne',18000,'Melbourne');
insert into stadiums values('Southside',18000,'Sydney');
insert into stadiums values('Belmore',11000,'Sydney');
insert into stadiums values('Canberra Stadium',NULL,'Canberra');
insert into stadiums values('Exies',19000,'Griffith');
insert into stadiums values('Coopers',28000,'Adelaide');
insert into stadiums values('White City',18000,'Sydney');


insert into teams values ('Liverpool','Ambassador',NULL,NULL,'Coelho');
insert into teams values ('Nottingham Forest','Albany','17-Aug-2007','22-Aug,2007','Delic');
insert into teams values ('Aston Villa','Royal','17-Aug-2007','23-Aug,2007','Hanley');
insert into teams values ('Manchester United','Ambassador','12-Aug-2007','17-Aug,2007','Kubot');
insert into teams values ('Southampton','Lorne','13-Aug-2007','22-Aug,2007','Andreev');
insert into teams values ('Norwich City','Ambassador','14-Aug-2007','25-Aug,2007','Dlouhy');
insert into teams values ('Blackburn Rovers','Albany','15-Aug-2007','19-Aug,2007','Rochus');
insert into teams values ('Everton','Royal','17-Aug-2007','20-Aug,2007','Friedl');
insert into teams values ('Sunderland','Ambassador','14-Aug-2007','20-Aug,2007','Pavel');
insert into teams values ('Ipswich Town','Ambassador','21-Aug-2007','24-Aug,2007','Erlich');
insert into teams values ('Tottenham Hotspur','Lorne','16-Aug-2007','20-Aug,2007','Aspelin');
insert into teams values ('Chelsea','Lorne','8-Aug-2007','20-Aug,2007','Shaun');
insert into teams values ('Real Madrid','Ambassador','16-Aug-2007',NULL,'Jimmy');


INSERT INTO matches VALUES (1,'17-Aug-2007', 'Liverpool', 1, 'Aston Villa', 0,'Acer Arena',6,'Bryan');
INSERT INTO matches VALUES (2,'17-Aug-2007', 'Manchester United', 3, 'Southampton', 1,'Acer Arena',4,'Kubot');
INSERT INTO matches VALUES (3,'17-Aug-2007', 'Liverpool', 1, 'Sunderland', 1,'Ballymore',5,'Bryan');
INSERT INTO matches VALUES (4,'17-Aug-2007', 'Everton', 2, 'Blackburn Rovers', 2,'Canberra Stadium',3,'Peya');
INSERT INTO matches VALUES (5,'18-Aug-2007', 'Nottingham Forest', 0, 'Chelsea', 0,'Acer Arena',2,'Bill');
INSERT INTO matches VALUES (6,'18-Aug-2007', 'Southampton', 2, 'Tottenham Hotspur', 1,'Ballymore',4,'Healey');
INSERT INTO matches VALUES (7,'18-Aug-2007', 'Norwich City', 0, 'Ipswich Town', 2,'Ballymore',5,'Erlich');
INSERT INTO matches VALUES (8,'18-Aug-2007', 'Chelsea', 4, 'Blackburn Rovers', 3,'Coopers',3,'Becker');
INSERT INTO matches VALUES (9,'19-Aug-2007', 'Everton', 1, 'Sunderland', 0,'Acer Arena',7,'Peya');
INSERT INTO matches VALUES (10,'19-Aug-2007', 'Ipswich Town', 1, 'Tottenham Hotspur', 1,'Ballymore',2,'Almagro');
INSERT INTO matches VALUES (11,'19-Aug-2007', 'Aston Villa', 3, 'Liverpool', 1,'Exies',1,'Bryan');
INSERT INTO matches VALUES (12,'20-Aug-2007', 'Norwich City', 4, 'Chelsea', 0,'Ballymore',3,'Bill');
INSERT INTO matches VALUES (13,'20-Aug-2007', 'Aston Villa',2 , 'Norwich City',2,'Ballymore',5,'Hanley' );
INSERT INTO matches VALUES (14,'20-Aug-2007', 'Nottingham Forest', 0, 'Liverpool',3,'Acer Arena',4,'Delic' );
INSERT INTO matches VALUES (15,'23-Aug-2007', 'Liverpool',0 , 'Manchester United',1,'White City',5,'Bryan' );
INSERT INTO matches VALUES (16,'23-Aug-2007', 'Southampton',0 , 'Aston Villa',1,'Exies' ,4,'Healey');
INSERT INTO matches VALUES (17,'24-Aug-2007', 'Tottenham Hotspur',2 , 'Liverpool',2,'Acer Arena',4,'Bryan' );
INSERT INTO matches VALUES (18,'25-Aug-2007', 'Sunderland', 1, 'Ipswich Town',0,'Ballymore',5,'Pavel' );
INSERT INTO matches VALUES (19,'27-Aug-2007', 'Sunderland', 1, 'Everton',2,'Acer Arena',6,'Pavel' );
INSERT INTO matches VALUES (20,'27-Aug-2007', 'Blackburn Rovers', 2, 'Everton',0,'Coopers',3,'Friedl' );
INSERT INTO matches VALUES (21,'27-Aug-2007', 'Blackburn Rovers', 3, 'Nottingham Forest', 3,'Acer Arena',3,'Rochus');
INSERT INTO matches VALUES (22,'27-Aug-2007', 'Chelsea', 1, 'Nottingham Forest',1,'Coopers',3,'Bill' );
INSERT INTO matches VALUES (23,'27-Aug-2007', 'Tottenham Hotspur', 4, 'Norwich City',1,'Exies',5,'Aspelin');
INSERT INTO matches VALUES (24,'27-Aug-2007', 'Ipswich Town', 1, 'Southampton',3,'Acer Arena',4,'Erlich' );
INSERT INTO matches VALUES (25,'27-Aug-2007', 'Nottingham Forest', 6, 'Manchester United',0,'Acer Arena',5,'Kubot' );
INSERT INTO matches VALUES (26,'28-Aug-2007', 'Sunderland', 1, 'Ipswich Town',1,'Exies',6,'Andreev' );
INSERT INTO matches VALUES (27,'28-Aug-2007', 'Aston Villa', 2, 'Chelsea',2,'Exies',7,'Shaun' );


insert into favStadiums values('Coelho','Acer Arena');
insert into favStadiums values('Arthurs','Acer Arena');
insert into favStadiums values('Delic','Acer Arena');
insert into favStadiums values('Jimmy','Acer Arena');
insert into favStadiums values('Kubot','Acer Arena');
insert into favStadiums values('Andreev','Acer Arena');
insert into favStadiums values('Dlouhy','Acer Arena');
insert into favStadiums values('Friedl','Acer Arena');
insert into favStadiums values('Pavel','Acer Arena');
insert into favStadiums values('Erlich','Acer Arena');
insert into favStadiums values('Aspelin','Acer Arena');
insert into favStadiums values('Shaun','Acer Arena');
insert into favStadiums values('Rochus','Acer Arena');
insert into favStadiums values('Bill','Acer Arena');
insert into favStadiums values('Rochus','Ballymore');
insert into favStadiums values('Rochus','Canberra Stadium');
insert into favStadiums values('Rochus','Coopers');
insert into favStadiums values('Rochus','Exies');
insert into favStadiums values('Rochus','White City');
insert into favStadiums values('Coelho','White City');
insert into favStadiums values('Arthurs','Ballymore');
insert into favStadiums values('Arthurs','Canberra Stadium');
insert into favStadiums values('Hanley','Exies');
insert into favStadiums values('Bill','Coopers');
insert into favStadiums values('Arthurs','Coopers');
insert into favStadiums values('Shaun','White City');
insert into favStadiums values('Coelho','Exies');
insert into favStadiums values('Hanley','Coopers');
insert into favStadiums values('Coelho','Coopers');
insert into favStadiums values('Delic','Coopers');
insert into favStadiums values('Jimmy','Coopers');
insert into favStadiums values('Kubot','Coopers');
insert into favStadiums values('Andreev','Coopers');
insert into favStadiums values('Dlouhy','Coopers');
insert into favStadiums values('Friedl','Coopers');
insert into favStadiums values('Pavel','Coopers');
insert into favStadiums values('Erlich','Coopers');
insert into favStadiums values('Aspelin','Coopers');
insert into favStadiums values('Shaun','Coopers');
insert into favStadiums values('Bryan','Exies');

commit;

insert into fans values ('Aidan','22-Nov-2001','Ambassador','16-Aug-2007','23-Aug-2007',NULL);
insert into fans values ('Caden','12-Sep-1976','Lorne','11-Aug-2007','21-Aug-2007',NULL);
insert into fans values ('Riley','14-Mar-2972','Royal','15-Aug-2007','23-Aug-2007',NULL);
insert into fans values ('Caleb','22-Dec-1988','Ambassador','16-Aug-2007','24-Aug-2007',NULL);
insert into fans values ('Hannah','21-Mar-1998','Lorne','11-Aug-2007','23-Aug-2007',NULL);
insert into fans values ('Emma','21-Mar-1998','Lorne','11-Aug-2007','23-Aug-2007',NULL);
insert into fans values ('Dlouhy','21-Mar-1998','Ambassador','11-Aug-2007','23-Aug-2007',NULL);
insert into fans values ('Grace','11-Sep-1976','Royal','12-Aug-2007','23-Aug-2007',NULL);
insert into fans values ('Ella','12-mar-1982',NULL,NULL,NULL,NULL);
insert into fans values ('Cadence','11-Sep-1934',NULL,NULL,NULL,NULL);






insert into favTeams values('Aidan','Liverpool');
insert into favTeams values('Caden','Aston Villa');
insert into favTeams values('Caden','Southampton');
insert into favTeams values('Caden','Nottingham Forest');
insert into favTeams values('Ella','Liverpool');
insert into favTeams values('Grace','Liverpool');
insert into favTeams values('Dlouhy','Real Madrid');
insert into favTeams values('Emma','Real Madrid');
insert into favTeams values('Riley','Blackburn Rovers');
insert into favTeams values('Caleb','Nottingham Forest');

insert into favPlayers values('Aidan','Rochus');
insert into favPlayers values('Dlouhy','Becker');
insert into favPlayers values('Emma','Becker');
insert into favPlayers values('Aidan','Arthurs');
insert into favPlayers values('Riley','Rochus');
insert into favPlayers values('Riley','Coelho');
insert into favPlayers values('Hannah','Coelho');
insert into favPlayers values('Hannah','Rochus');
insert into favPlayers values('Hannah','Becker');
insert into favPlayers values('Grace','Arthurs');
insert into favPlayers values('Grace','Rochus');
insert into favPlayers values('Cadence','Hanley');
insert into favPlayers values('Cadence','Shaun');
insert into favPlayers values('Cadence','Bill');
insert into favPlayers values('Ella','Arthurs');
insert into favPlayers values('Ella','Rochus');

commit;

insert into autographs values('Aidan','Coelho','Acer Arena','17-Aug-2007');
insert into autographs values('Aidan','Rochus','Ballymore','18-Aug-2007');
insert into autographs values('Grace','Rochus','Exies','19-Aug-2007');
insert into autographs values('Cadence','Bill','Canberra Stadium','20-Aug-2007');
insert into autographs values('Cadence','Arthurs','Coopers','21-Aug-2007');
insert into autographs values('Ella','Coelho','White City','18-Aug-2007');
insert into autographs values('Caden','Rochus','White City','19-Aug-2007');
update autographs set fan='Riley' where fan='Aidan' or fan='Cadence';
delete from autographs where stadium='White City';

insert into medicalServices values('Liverpool',4);
insert into medicalServices values('Blackburn Rovers',5);
insert into medicalServices values('Blackburn Rovers',3);
insert into medicalServices values('Aston Villa',1);
insert into medicalServices values('Aston Villa',4);
insert into medicalServices values('Sunderland',4);
insert into medicalServices values('Southampton',7);
insert into medicalServices values('Tottenham Hotspur',8);
insert into medicalServices values('Nottingham Forest',7);
insert into medicalServices values('Everton',5);
insert into medicalServices values('Norwich City',6);
insert into medicalServices values('Chelsea',8);
insert into medicalServices values('Manchester United',8);
insert into medicalServices values('Sunderland',5);
insert into medicalServices values('Ipswich Town',8);

set feedback on;
commit;

