require_relative './movie'

class MovieRepository
  def all
    movies = []

    sql = 'SELECT * FROM movies;'
      result_set = DatabaseConnection.exec_params(sql, [])

      result_set.each do |record|
      movie = Movie.new

      movie.id = record['id'].to_i
      movie.title = record['title']
      movie.genre = record['genre']
      movie.release_year = record['release_year'].to_i


    movies << movie
    end
    return movies
  end

  
end