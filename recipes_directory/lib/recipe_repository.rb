require 'recipe'

class RecipeRepository
    def all
        sql = 'SELECT id, recipe, cooking_time, rating FROM recipes;'

        result_set = DatabaseConnection.exec_params(sql, [])
        
        recipes = []

        for result in result_set #the for 'result' treats  'result' as an individual element in the 'result_set'array
          # p result #these 2 lines allow us to check manually, what is held in the database ...you'll see result printed in terminal
            recipe = Recipe.new

            recipe.id = result['id'].to_i
            recipe.recipe = result['recipe']
            recipe.cooking_time = result['cooking_time']
            recipe.rating = result['rating'].to_i
            #maps all database values into an object
            recipes << recipe
        end
        return recipes 
    end

    def find(id)
        # Executes the SQL query:
        sql = 'SELECT id, recipe, cooking_time, rating FROM recipes WHERE id = $1;'
        
        sql_params = [id]
    
        result_set = DatabaseConnection.exec_params(sql, sql_params)

        recipe = Recipe.new

        recipe.id = result_set[0]['id'].to_i
        recipe.recipe = result_set[0]['recipe']
        recipe.cooking_time  = result_set[0]['cooking_time']
        recipe.rating = result_set[0]['rating'].to_i

        return recipe

    
        # Returns a single Recipe(class) object.
      end
end