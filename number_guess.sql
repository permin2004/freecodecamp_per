codeally@a73d246bd588:~/project$ psql --username=freecodecamp --dbname=postgres
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

postgres=> create database number_guess;
CREATE DATABASE
postgres=> \c number_guess;
You are now connected to database "number_guess" as user "freecodecamp".
number_guess=> create table users (user_id SERIAL PRIMARY KEY, username varchar(50) not null unique);
CREATE TABLE
number_guess=> \d users
number_guess=> create table games(game_id SERIAL PRIMARY KEY, number_of_guesses INT NOT NULL, user_id INT references users(user_id));
CREATE TABLE
number_guess=> \d games;
number_guess=> select * from games;
 game_id | number_of_guesses | user_id 
---------+-------------------+---------
       1 |                16 |       2
(1 row)

number_guess=> select * from users;
 user_id | username 
---------+----------
       1 | test
       2 | tets
(2 rows)

number_guess=> 
