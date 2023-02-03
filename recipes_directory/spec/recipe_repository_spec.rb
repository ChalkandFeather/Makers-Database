require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/recipe_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipe_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do   
    reset_recipes_table
  end

  it 'returns all recipes from database' do
    repo = RecipeRepository.new

    recipes = repo.all
 
    expect(recipes.length).to eq 2

    expect(recipes[0].id).to eq 1
    expect(recipes[0].recipe).to eq 'Spaghetti Bolognaise'
    expect(recipes[0].cooking_time).to eq '180mins'
    expect(recipes[0].rating).to eq 4

    expect(recipes[1].id).to eq 2
    expect(recipes[1].recipe).to eq 'Lemon Cake'
    expect(recipes[1].cooking_time).to eq '50mins'
    expect(recipes[1].rating).to eq 5
  end

it 'returns recipe by id from the database' do
  repo = RecipeRepository.new

recipes = repo.find(2)

    expect(recipes.id).to eq 2
    expect(recipes.recipe).to eq 'Lemon Cake'
    expect(recipes.cooking_time).to eq '50mins'
    expect(recipes.rating).to eq 5
  end
end

