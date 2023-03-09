codeally@e74a8b8f28ad:~/project$ psql --username=freecodecamp --dbname=periodic_table
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

periodic_table=>  ALTER TABLE properties rename column weight to atomic_mass;
ALTER TABLE
periodic_table=> ALTER TABLE properties rename column melting_point to melting_point_celcius;
ALTER TABLE
periodic_table=> ALTER TABLE properties rename column melting_point_celcius to melting_point_celsius;
ALTER TABLE
periodic_table=> ALTER TABLE properties rename column boiling_point to boiling_point_celsius;
ALTER TABLE
periodic_table=> ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE
periodic_table=> ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE
periodic_table=> ALTER TABLE elements ADD CONSTRAINT symbol_unique UNIQUE (symbol);
ALTER TABLE
periodic_table=> ALTER TABLE elements ADD CONSTRAINT name_unique UNIQUE (name);
ALTER TABLE
periodic_table=> ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE
periodic_table=> ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
ALTER TABLE
periodic_table=> ALTER TABLE                  properties ADD CONSTRAINT fk_atomic_number FOREIGN KEY (atomic_number) REFERENCES elements (atomic_number);
ALTER TABLE
periodic_table=> CREATE TABLE types(type_id INT PRIMARY KEY, type VARCHAR(250) NOT NULL);
CREATE TABLE
periodic_table=> INSERT INTO types VALUES(1,'non metal');
INSERT 0 1
periodic_table=> INSERT INTO types VALUES(2, 'metalloid');
INSERT 0 1
periodic_table=> INSERT INTO types VALUES(3, 'metal');
INSERT 0 1
periodic_table=> UPDATE types SET type = 'nonmetal' WHERE type_id = 1;
UPDATE 1
periodic_table=> ALTER TABLE properties ADD COLUMN type_id INT;
ALTER TABLE
periodic_table=> ALTER TABLE properties ADD CONSTRAINT fk_type_id FOREIGN KEY (type_id) REFERENCES types (type_id);
ALTER TABLE
periodic_table=> UPDATE properties SET type_id = 1 WHERE type= 'nonmetal';
UPDATE 5
periodic_table=> UPDATE properties SET type_id = 2 WHERE type= 'metalloid';
UPDATE 2
periodic_table=> UPDATE properties SET type_id = 3 WHERE type= 'metal';
UPDATE 2
periodic_table=> ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
ALTER TABLE
periodic_table=> UPDATE elements SET symbol= 'He' where symbol='he';
UPDATE 1
periodic_table=> UPDATE elements SET symbol= 'Li' where symbol='li';
UPDATE 1
periodic_table=> UPDATE elements SET symbol= 'MT' where symbol='mT';
UPDATE 1
periodic_table=> ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
ALTER TABLE
periodic_table=> UPDATE properties SET atomic_mass=TRIM(TRAILING '0' FROM CAST(atomic_mass AS TEXT))::DECIMAL;
UPDATE 9
periodic_table=> INSERT INTO elements VALUES (9,'F','Fluorine');
INSERT 0 1
periodic_table=> INSERT INTO properties VALUES(9,'nonmetal',18.998,-220,-188.1,1);
INSERT 0 1
periodic_table=> periodic_table=> INSERT INTO elements VALUES (10,'Ne','Neon');
ERROR:  syntax error at or near "periodic_table"
LINE 1: periodic_table=> INSERT INTO elements VALUES (10,'Ne','Neon'...
        ^
periodic_table=> INSERT INTO elements VALUES (10,'Ne','Neon');
INSERT 0 1
periodic_table=> INSERT INTO properties VALUES(10,'nonmetal',20.18,-248.6,-246.1,1);
INSERT 0 1
periodic_table=> ALTER TABLE properties DROP COLUMN type;
ALTER TABLE
periodic_table=> UPDATE properties SET atomic_mass = 1.008 WHERE atomic_number = 1;
UPDATE 1
periodic_table=> DELETE FROM properties where atomic_number = 1000;
DELETE 1
periodic_table=> DELETE FROM elements where atomic_number = 1000;
DELETE 1
periodic_table=> 
