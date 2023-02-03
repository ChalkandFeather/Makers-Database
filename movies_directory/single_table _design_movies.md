Single Table Design Recipe Template

Copy this recipe template to design and create a database table from a specification.
1. Extract nouns from the user stories or specification

# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' titles.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' genres.

As a person who loves movies,
So I can list all my favourite movies
I want to see a list of movies' release year.



Nouns:

(list)movies, title, genre, release_year

2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.


Name of the table (always plural): students

Column names: name, cohort

| Record       | properties |
|---------------------------------
|movies    |   title, genre, release_year |

3. Decide the column types.

Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

id: SERIAL
title: text
genre: text
release_year: int

4. Write the SQL.

-- EXAMPLE
-- file: movies_directory.sql

-- Replace the table name, columm names and types.

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title TEXT,
  genre TEXT,
  release_year INT
);

5. Create the table.


6. Create SQL
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

psql -h 127.0.0.1 student_directory_1 < students_table.sql