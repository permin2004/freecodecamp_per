codeally@0d8bc4dcb7df:~/project$ psql --username=freecodecamp --dbname=postgres
Border style is 2.
Pager usage is off.
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

postgres=> \l
                                 List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| fail      | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| test      | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| universe  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
+-----------+--------------+----------+---------+---------+-----------------------+
(6 rows)

postgres=> \c universe
You are now connected to database "universe" as user "freecodecamp".
universe=> \l
                                 List of databases
+-----------+--------------+----------+---------+---------+-----------------------+
|   Name    |    Owner     | Encoding | Collate |  Ctype  |   Access privileges   |
+-----------+--------------+----------+---------+---------+-----------------------+
| fail      | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| postgres  | postgres     | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| template0 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| template1 | postgres     | UTF8     | C.UTF-8 | C.UTF-8 | =c/postgres          +|
|           |              |          |         |         | postgres=CTc/postgres |
| test      | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
| universe  | freecodecamp | UTF8     | C.UTF-8 | C.UTF-8 |                       |
+-----------+--------------+----------+---------+---------+-----------------------+
(6 rows)

universe=> \d
Did not find any relations.
universe=> CREATE TABLE constellation(constellation_id SERIAL UNIQUE, name_c VARCHAR(50) NOT NULL, abbreviations_nasa TEXT NOT NULL, name_meaning VARCHAR(500), brightest_star VARCHAR(50) NOT NULL, PRIMARY KEY(constellation_id));
CREATE TABLE
universe=> CREATE TABLE galaxy(galaxy_id SERIAL UNIQUE, name_g VARCHAR(40) NOT NULL UNIQUE, name_c VARCHAR (30) NOT NULL, naked_eye BOOLEAN, apparent_magnitute_rounded INT, distance_mly NUMERIC(6, 2), diameter_ly INT NOT NULL, PRIMARY KEY(galaxy_id));
CREATE TABLE
universe=> CREATE TABLE star(star_id SERIAL UNIQUE, name_s VARCHAR(40) NOT NULL UNIQUE, solar_system VARCHAR(50), name_c VARCHAR(30) NOT NULL, stellar_classification VARCHAR(10) NOT NULL, distance_ly NUMERIC(10, 4), absolute_magnitude NUMERIC(4, 2) NOT NULL, visible_magnitute_rounded INT, galaxy_id INT, PRIMARY KEY(star_id), FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id));
CREATE TABLE
universe=> CREATE TABLE planet(planet_id SERIAL UNIQUE, name_p VARCHAR(40) NOT NULL UNIQUE, name_s VARCHAR(40) NOT NULL, rotation_period_days NUMERIC(5, 2), confirmed_moons_nr INT, rings BOOLEAN, dwarf_planet BOOLEAN,star_id INT, PRIMARY KEY(planet_id),FOREIGN KEY (star_id) REFERENCES star(star_id));
CREATE TABLE
universe=>  CREATE TABLE moon(moon_id SERIAL UNIQUE, name_m VARCHAR(50) NOT NULL UNIQUE, name_p VARCHAR(50) NOT NULL, Semi_major_axis_km INT, name_meaning VARCHAR(800), orbital_period_days NUMERIC (8, 4), atmosphere VARCHAR(500) NOT NULL, planet_id INT,PRIMARY KEY(moon_id), FOREIGN KEY (planet_id) REFERENCES planet(planet_id));
CREATE TABLE
universe=> INSERT INTO constellation(constellation_id,name_c, abbreviations_nasa, name_meaning, brightest_star) VALUES(1, 'Andromeda','Andr','Andromeda (The chained maiden or princess)','Alpheratz'), (2,'Cassiopeia','Cass','Cassiopeia (mythological character)','Schedar'), (3,'Coma Berenices','Coma','Berenice s hair','β Comae Berenices'), (4,'Corvus','Corv','crow','Gienah'), (5,'Centaurus','Cent','centaur','Rigil Kentaurus'), (6,'Circinus','Circ','compasses','α Circini'), (7,'Saggitarius','Sgtr','archer','Kaus Australis'), (8,'Sculptor','Scul','sculptor','α Sculptoris'), (9,'Ursa Major','UMaj','great bear','Alioth'), (10,'Virgo','Virg','virgin or maiden','Spica');
INSERT 0 10
universe=> INSERT INTO galaxy(galaxy_id,name_g,name_c,naked_eye,apparent_magnitute_rounded,distance_mly, diameter_ly) VALUES(101,'Andromeda Galaxy','Andromeda', True, 3, 2.5, 152000), (102,'Antennae Galaxies','Corvus',False,11, 45,500000), (103,'Backward Galaxy','Centaurus',False,13, 111, 52185), (104,'Black Eye Galaxy','Coma Berenices',False,8,24.01,52962), (105,'Bode s Galaxy','Ursa Major',True,7,11.74,90000), (106,'Butterfly Galaxies','Virgo',False,11, 59.4,93000), (107,'Circinus Galaxy','Circinus', False,12, 13, 1300),(108,'Comet Galaxy','Sculptor', False, 19, 3200, 600000), (109, 'Sculptor Galaxy','Sculptor', True,7,12,90000), (110, 'Milky Way','Saggitarius', True, -6, 0.0265, 87400);
INSERT 0 10
universe=> INSERT INTO star(star_id,name_s,solar_system,name_c,stellar_classification,distance_ly,absolute_magnitude, visible_magnitute_rounded) VALUES (1001,'Star is Sun','Solar System','Saggitarius','G2V', 0,4.85,1000), (1002, 'Proxima Centauri','Star is Alpha Centauri','Centaurus','M5.5Ve',4.22,15.53,11), (1003,'Star is Alpheratz','unknown','Andromeda','B9p',97,-0.3,2), (1004,'Star is Alpha Circini','unknown','Circinus','F1Vp',53,2.11,3), (1005,'Star is Diadem','unknown','Coma Berenices','F5V',47,3.54,4), (1006,'Ross 128','Ross 128','Virgo','M4.0Vn',11.0074,13.51,10), (1007,'Gienah','unknown','Corvus','B8III',165,-1,3);
INSERT 0 7
universe=> INSERT INTO planet(planet_id,name_p,name_s,rotation_period_days,confirmed_moons_nr,rings,dwarf_planet) VALUES (1101,'Earth','Sun',1,1,False,False), (1102,'Mercury','Sun', 58.65,0,False,False), (1103,'Venus','Sun',243.02,0,False,False), (1104,'Mars','Sun',1.03,2,False,False), (1105,'Jupiter','Sun',0.41,92,True,False), (1106,'Saturn','Sun',0.44,83,True,False), (1107,'Uranus','Sun',0.72,27,True,False), (1108,'Neptune','Sun',0.67,14,True,False), (1109,'Pluto','Sun',6.39,5,False,True), (1110,'Haumea','Sun',0.16,2,True,True), (1111,'Ceres','Sun',0.38,0,False,True), (1112,'Quaoar','Sun',0.37,1,False,True), (1113,'Eris','Sun',15.79, 1,False,True),(1114,'Sedna','Sun', 0.43, 0,False,True);
INSERT 0 14
universe=> INSERT INTO moon(moon_id,name_m,name_p,Semi_major_axis_km,name_meaning,orbital_period_days,atmosphere) VALUES (50001,'Moon','Earth', 384399,'month', 27.32,'exosphere'), (50002,'Phobos','Mars',9377,'Greek god of fear and panic',0.3,'no atmosphere'), (50003,'Deimos','Mars', 23463,'Greek god of dread and terror',1.263,'no atmosphere'), (50004,'Io','Jupiter',421600,'Ancestor to Perseus, Cadmus, Heracles, and Minos',1.769,'very thin primarily sulfur dioxide'), (50005,'Europa','Jupiter',670900,'Mother of king Minos of Crete',3.551,'tenuous,solely oxygen'), (50006,'Ganymede','Jupiter',1070400,'Male hero of Troy. Served as Zeus cup-bearer in Olympus',7.154,'thin oxygen atmosphere'), (50007,'Callisto','Jupiter', 1882700,'One of the nymphs. Daughter of king Lycaon and one of Artemis followers',16.689,'very thin carbon dioxide exosphere'), (50008,'Amalthea','Jupiter',181365,'Foster-mother of Zeus',0.498,'...'), (50009,'Pasiphae','Jupiter',23912238,'Queen of Crete. Daughter of Helios and mother of the minotaur.',-700,'...'), (50010,'Mimas','Saturn',185520,'One of the Gigantes (giants). Son of Gaia (Earth)',0.942,'no detectable atmosphere'), (50011,'Enceladus','Saturn',237948,'One of the Gigantes (giants). Son of Gaia (Earth) and Uranus (Sky)', 1.37,'significant atmosphere composed mostly of water vapor'), (50012,'Tethys','Saturn',294619,'One of the Titans. Mother of the Oceanids.', 1.888,'no atmosphere'), (50013,'Dione','Saturn',377396,'One of the Titans',2.737,'ultra-thin layer of oxygen ions'), (50014,'Rhea','Saturn',527108,'One of the Titans. Older sister of Cronus.',4.518,'exosphere, infused with oxygen and carbon dioxide'), (50015,'Titan','Saturn',1221870,'Named after the Greek Titans',15.945,'mostly nitrogen (about 95 percent) and methane (about 5 percent), with small amounts of other carbon-rich compounds'), (50016,'Hyperion','Saturn',1481009,'Titan god of observation. Father of Helios, Eos, and Selene (the Moon).',21.276,'no atmosphere'), (50017,'Iapetus','Saturn',3560820,'One of the Titans. Father of Atlas and Prometheus. Also written as Japetus.',79.322,'no detactable atmosphere'), (50018,'Ariel','Uranus',190900,'Named after a character in Alexander Pope’s works.',2.52,'mostly hydrogen and helium, with a small amount of methane and traces of water and ammonia'), (50019,'Umbriel','Uranus',266000,'Named after the “dusky melancholy sprite” in Alexander Pope’s works.',4.144,'no known atmosphere'), (50020,'Titania','Uranus',436300,'Named after a charcter in Shakespeare’s play A Midsummer Night’s Dream',8.706,'may have a tenuous seasonal atmosphere of CO2'), (50021,'Oberon','Uranus',583519,'Named after a charcter in Shakespeare’s play A Midsummer Night’s Dream',13.46,'no detectable atmosphere'), (50022,'Galatea','Neptune',61952,'One of the Nereids in Greek mythology',0.4287,'too small to support an atmosphere');
INSERT 0 22
universe=> ALTER TABLE constellation ADD COLUMN name VARCHAR(10);
ALTER TABLE
universe=> ALTER TABLE galaxy ADD COLUMN name VARCHAR(10);
ALTER TABLE
universe=> ALTER TABLE star ADD COLUMN name VARCHAR(20);
ALTER TABLE
universe=> ALTER TABLE planet ADD COLUMN name VARCHAR(10);
ALTER TABLE
universe=> ALTER TABLE moon ADD COLUMN name VARCHAR(20);
ALTER TABLE
universe=> ALTER TABLE constellation ADD CONSTRAINT UNIQUE(abbreviations_nasa);
ERROR:  syntax error at or near "UNIQUE"
LINE 1: ALTER TABLE constellation ADD CONSTRAINT UNIQUE(abbreviation...
                                                 ^
universe=> \d constellation
                                                  Table "public.constellation"
+--------------------+------------------------+-----------+----------+---------------------------------------------------------+
|       Column       |          Type          | Collation | Nullable |                         Default                         |
+--------------------+------------------------+-----------+----------+---------------------------------------------------------+
| constellation_id   | integer                |           | not null | nextval('constellation_constellation_id_seq'::regclass) |
| name_c             | character varying(50)  |           | not null |                                                         |
| abbreviations_nasa | text                   |           | not null |                                                         |
| name_meaning       | character varying(500) |           |          |                                                         |
| brightest_star     | character varying(50)  |           | not null |                                                         |
| name               | character varying(10)  |           |          |                                                         |
+--------------------+------------------------+-----------+----------+---------------------------------------------------------+
Indexes:
    "constellation_pkey" PRIMARY KEY, btree (constellation_id)

universe=> ALTER TABLE constellation ADD CONSTRAINT abbreviations_nase_unique UNIQUE(abbreviations_nasa);
ALTER TABLE
universe=> ALTER TABLE galaxy ADD CONSTRAINT name_g_unique UNIQUE(name_g);
ALTER TABLE
universe=> ALTER TABLE star ADD CONSTRAINT name_s_unique UNIQUE(name_s);
ALTER TABLE
universe=> ALTER TABLE planet ADD CONSTRAINT name_p_unique UNIQUE(name_p);
ALTER TABLE
universe=> ALTER TABLE moon ADD CONSTRAINT name_m_unique UNIQUE(name_m);
ALTER TABLE
