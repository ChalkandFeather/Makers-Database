require 'movie_repository'

RSpec.describe MovieRepository do

    def reset_movies_directory_table
      seed_sql = File.read('spec/seeds_movies_directory.sql')
      connection = PG.connect( {host: '127.0.0.1', dbname: 'movies_directory_test'} )
      connection.exec(seed_sql)
    end 

    before(:each) do
      reset_movies_directory_table
    end
    
  it 'returns #all movies' do
      repo = MovieRepository.new
      movies = repo.all

  expect(movies.length).to eq (2)

  expect(movies[0].id).to eq (1)
  expect(movies[0].title).to eq ('The Shining')
  expect(movies[0].genre).to eq ('horror')
  expect(movies[0].release_year).to eq (1980)

  expect(movies[1].id).to eq (1)
  expect(movies[1].title).to eq ('The Shining')
  expect(movies[1].genre).to eq ('horror')
  expect(movies[1].release_year).to eq (1980)
  end
end

 