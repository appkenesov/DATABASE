create table users(
id serial,
firstname varchar(50),
lastname varchar(50)
);

ALTER TABLE users ADD COLUMN isadmin INTEGER;

ALTER TABLE users ALTER COLUMN isadmin TYPE BOOLEAN USING isadmin::BOOLEAN;

ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

ALTER TABLE users ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE TABLE tasks (
    id serial,
    name varchar(50),
    user_id integer
);

DROP TABLE tasks;

DROP DATABASE lab1;