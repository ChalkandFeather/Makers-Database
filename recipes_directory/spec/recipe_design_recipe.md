Single Table Design Recipe Template

Copy this recipes template to design and create a database table from a specification.
1. Extract nouns from the user stories or specification

# EXAMPLE USER STORY:
# (analyse only the relevant part - here the final line).
As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).



Nouns:

(list)recipe, cooking_time, rating

2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.


Name of the table (always plural): recipes

Column names: , |recipe  |  cooking_time, rating |

| Record       | properties |
|---------------------------------
|recipe  |  cooking_time, rating |

3. Decide the column types.

Here's a full documentation of PostgreSQL data types.

Most of the time, you'll need either text, int, bigint, numeric, or boolean. If you're in doubt, do some research or ask your peers.

Remember to always have the primary key id as a first column. Its type will always be SERIAL.

# EXAMPLE:

id: SERIAL
recipe: text
cooking_time: text
rating: int

4. Write the SQL.

-- EXAMPLE
-- file: recipe_directory.sql

-- Replace the table name, columm names and types.

CREATE TABLE recipes (
  id SERIAL PRIMARY KEY,
  recipe TEXT,
  cooking_time TEXT,
  rating INT
);

5. Create the table.


6. Create SQL
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, youd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (recipe, cooking, rating) VALUES ('Spaghetti Bolognaise', '180mins', 4);
INSERT INTO recipes (recipe, cooking, rating) VALUES ('Lemon Cake', '50mins', 5);

psql -h 127.0.0.1 recipe_directory_test < ./spec/recipe_seeds.sql
=>TRUNCATE TABLE
INSERT 0 1
INSERT 0 1


3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

# EXAMPLE
# Table name: recipes

# Model class
# (in lib/student.rb)
class Recipe
end

# Repository class
# (in lib/student_repository.rb)
class RecipeRepository
end

4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: recipes

# Model class
# (in lib/student.rb)

class Recipe

  # Replace the attributes by your own columns.
  attr_accessor :id, :recipe, :cooking_time, :rating
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
#recipe_option = Recipe.new
#recipe_option.id = '1'
#recipe_option.recipe = 'Spaghetti Bolognaise'
#recipe_option.cooking_time = '180mins'
#recipe_option.rating = '4'

You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: recipes

# Repository class
# (in lib/recipes_repository.rb)

class StudentRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, recipe, cooking_time, rating FROM recipes;

    #result_set = DatabaseConnection.exec_params(sql, [])

    # Returns an array of Recipe(class) objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, recipe, cooking_time, rating FROM recipes WHERE id = $1;
    # sql_params = [id]

     #result_set = DatabaseConnection.exec_params(sql, sql_params)

    # Returns a single Recipe(class) object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(student)
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end

6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES

# 1
# Get all recipes
#recipes (recipe, cooking_time, rating) VALUES ('Spaghetti Bolognaise', '180mins', 4);
#recipes (recipe, cooking_time, rating) VALUES ('Lemon Cake', '50mins', 5);


repo = RecipeRepository.new

recipes = repo.all

recipes.length # =>  2

recipes[0].id # =>  1
recipes[0].recipe # =>  'Spaghetti Bolognaise'
recipes[0].cooking_time # =>  '180mins'
recipes[0].rating # => 4

recipes[1].id # =>  2
recipes[1].name # =>  'Lemon Cake'
recipes[1].cooking_time # =>  '50mins'
recipes[1].rating # => 5

# 2
# Get a single recipe

repo = RecipeRepository.new

recipes = repo.find(2)

recipes[1].id # =>  2
recipes[1].name # =>  'Lemon Cake'
recipes[1].cooking_time # =>  '50mins'
recipes[1].rating # => 5

# Add more examples for each method

Encode this example as a test.
7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_recipes_table
  end

  # (your tests will go here).
end

8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.