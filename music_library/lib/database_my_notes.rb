artist - Artist.new

artist.name # 'Pixies'
artist.genre # 'Rock'

#select all artists
#SQL: SELECT id, name, genre FROM artists;
#Return an array of Artists objects

artist_repository.all

#select a single artist
#SQL: SELECT id, name, genre FROM  artists WHERE id = '1';
#return a single Artists object

artist_repostitory.find(1)

new_artist = Artist.new
new_artist.name = 'Radiohead'
# ..
#SQL: INSERT INTO artists ....

artist_repository.create(new_artist)

