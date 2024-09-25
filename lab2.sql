create database lab2;

create table countries(
country_id serial primary key,
country_name varchar(255),
region_id integer,
population integer
);
insert into countries(country_name ,region_id,population)
values('Kazakhastan',7,2000000);

insert into countries(country_id,country_name)
values(2,'KGZ');

insert into countries(country_name ,region_id,population)
values('Mexico',null,200000);

insert into countries (country_name, region_id, population) 
values
('Argentina', 1, 45000000),
('France', 2, 67000000),
('Germany', 2, 83000000);

alter table countries alter column country_name set default 'Kazakhstan';

INSERT INTO countries (region_id, population) 
VALUES (3, 19000000);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries 
SET region_id = 1 
WHERE region_id IS NULL;

SELECT country_name, population * 1.1 AS "New Population" 
FROM countries;

DELETE FROM countries 
WHERE population < 100000;

DELETE FROM countries_new 
WHERE country_id IN (SELECT country_id FROM countries) 
RETURNING *;

DELETE FROM countries 
RETURNING *;