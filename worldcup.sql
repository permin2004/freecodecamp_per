codeally@fa6f31c8eb00:~/project$ psql --username=freecodecamp --dbname=postgres
psql (12.9 (Ubuntu 12.9-2.pgdg20.04+1))
Type "help" for help.

postgres=> create database worldcup;
CREATE DATABASE
postgres=> \c worldcup;
You are now connected to database "worldcup" as user "freecodecamp".
worldcup=> create table teams (team_id serial primary key, name varchar(80) not null);
CREATE TABLE
worldcup=> create table games (game_id serial primary key, year int not null, round varchar(80) not null, winner_id int not null, opponent_id int not null);
CREATE TABLE
worldcup=> alter table games add foreign key(winner_id) references teams(team_id);
ALTER TABLE
worldcup=> alter table games add foreign key(opponent_id) references teams(team_id);
ALTER TABLE
worldcup=> alter table games add column winner_goals int not null;
ALTER TABLE
worldcup=> alter table games add column opponent_goals int not null;
ALTER TABLE
worldcup=> alter table teams add constraint name_teams_key VARCHAR(50) unique (name);
ERROR:  syntax error at or near "VARCHAR"
LINE 1: alter table teams add constraint name_teams_key VARCHAR(50) ...
                                                        ^
worldcup=> alter table teams add constraint name_teams_key unique (name);
ALTER TABLE
worldcup=> \d teams
                                      Table "public.teams"
 Column  |         Type          | Collation | Nullable |                Default                 
---------+-----------------------+-----------+----------+----------------------------------------
 team_id | integer               |           | not null | nextval('teams_team_id_seq'::regclass)
 name    | character varying(80) |           | not null | 
Indexes:
    "teams_pkey" PRIMARY KEY, btree (team_id)
    "name_teams_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "games" CONSTRAINT "games_opponent_id_fkey" FOREIGN KEY (opponent_id) REFERENCES teams(team_id)
    TABLE "games" CONSTRAINT "games_winner_id_fkey" FOREIGN KEY (winner_id) REFERENCES teams(team_id)
