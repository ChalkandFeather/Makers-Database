-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, youd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE movies RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO movies (title, genre, release_year) VALUES ('The Shining', 'horror', 1980);
INSERT INTO movies (title, genre, release_year) VALUES ('Almost Famous', 'biopic', 2000);

--previous examples:
---INSERT INTO artists (name, genre) VALUES('Pixies', 'Rock');
---INSERT INTO artists (name, genre) VALUES('ABBA', 'Pop');
