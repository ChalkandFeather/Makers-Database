require_relative './album'

class AlbumRepository
  def all
    albums = []

    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
      result_set = DatabaseConnection.exec_params(sql, [])

      result_set.each do |record|
      album = Album.new

      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album
    end
    return albums
  end

  def find
    albums = []

    sql = 'SELECT * FROM albums;'
      result_set = DatabaseConnection.exec_params(sql, [])

      result_set.each do |record|
      album = Album.new

      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album
    end
    return albums
  end

  def find(id)
 
     sql = 'SELECT id, title, release_year FROM albums WHERE id = $1;'
    
        sql_params = [id]
    
        result_set = DatabaseConnection.exec_params(sql, params)
        
        album = Album.new

        album.id = result_set[0]['id'].to_i
        album.title = result_set[0]['title']
        album.release_year = result_set[0]['release_year']
        album.artist_id = result_set[0]['artist_id']
    
        # (The code now needs to convert the result to a
        # album object and return it)
      end
      return album  
    end
end