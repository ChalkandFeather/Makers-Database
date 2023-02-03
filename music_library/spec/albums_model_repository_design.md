Albums Model and Repository Classes Design Recipe

Copy this recipe template to design and implement Model and Repository classes for a database table.
#####DONE!!!!!

1. Design and create the Table- #######SKIP THIS STEP AS TABLE IS CREATED!!!!!!!!

If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

In this template, we'll use an example table students

# EXAMPLE

Table: students

Columns:
id | name | cohort_name

2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

'SQL
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, youd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE students RESTART IDENTITY; -- replace with your own table name.

TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART 

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

```
INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');

INSERT INTO albums (title, release_year, artist_id) VALUES ('Bossanova', '1999', '1');

INSERT INTO albums (title, release_year, artist_id) VALUES ('Surfer Roda', '2001', '1');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```psql -h 127.0.0.1 music_library_test < ./spec/seeds_albums.sql
=> should see 
TRUNCATE TABLE
TRUNCATE TABLE
INSERT 0 1
INSERT 0 1
INSERT 0 1

=> psql -h 127.0.0.1 music_library_test 
switches into music_library_test
````
=> music_library_test=# SELECT * FROM albums;

 id |    title    | release_year | artist_id 
----+-------------+--------------+-----------
  1 | Bossanova   |         1999 |         1
  2 | Surfer Roda |         2001 |         1



3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: albums

# Model class
# (in lib/album.rb)
class Album

  attr_accessor :id, :title, :release_year, :artist_id
end

# Repository class
# (in lib/album_repository.rb)

class AlbumRepository
#selecting all records
#no arguements
def all
#executes the SQL query
#SELECT id, title, release_year, artist_id FROM albums;

#returns an array of Album objects
# Gets a single record by its ID
  # One argument: the id (number)
  
  def find(id, title)
    # Executes the SQL query:
    # SELECT id, title, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end

```To check it's working - can connect to
```psql -h 127.0.0.1 music_library_test  and run => SELECT id, title, release_year, artist_id FROM albums; 

end

def find(id, title)
SELECT id, title
 sql = SELECT title, release_year FROM albums WHERE id = $1; AND title = $2;

    sql_params = [id, title]

    result_set = DatabaseConnection.exec_params(sql, params)

    # (The code now needs to convert the result to a
    # album object and return it)
  end
  # return single album object
end


4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: albums

# Model class
# (in lib/album.rb)

class Album

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :cohort_name
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# student = Student.new
# student.name = 'Jo'
# student.name

You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: albums

# Repository class
# (in lib/album_repository.rb)

class AlbumRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, release_year, artist_id FROM albums;

    # Returns an array of Album objects.
  end


6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all albums
```create album_repository spec

repo = AlbumsRepository.new

albums = repo.all
albums.length # => 2
albums.first.title # => 'Bossanova'
albums.find.release_year # => '1999'
albums.find.artist_id # => '1'

which is written in the Album repository like so=>
Spec.describe AlbumsRepository do
  it 'returns two albums' do

  repo = AlbumsRepository.new
albums = repo.all

  expect(albums.length).to eq ('2')
  expect(albums.first.title).to eq ('Bossanova')
  expect(albums.find.release_year).to eq ('1999')
  expect(albums.find.artist_id).to eq ('1')
  end
end
```

# Add more examples for each method

Encode this example as a test.

7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/album_repository_spec.rb - to be copied in to this 
def reset_album_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect( {host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

 before(:each) do
      reset_albums_table
    end

  # (your tests will go here- As added in earlier step 6).
end

8. Test-drive and implement the Repository class behaviour

RSPEC - by suite
```rspec spec/album_repository_spec.rb

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

#####UPDATE THE app.rb with 
album_repository = AlbumRepository.new

&&&&&& below artist_repository.all.....
album_repository.all.each do |album|
    p album
  end

  &&&&& at the top of app with other require..
  require_relative 'lib/album_repository'

  RUN RUBY ADD 'ruby add.rb (from within music_library) TO SHOW WHAT THE DATABASE ACTUALLY CONTAINS not the music_llibrary_test
