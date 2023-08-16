require './input_functions'

# Task 6.2 T - use the code from 5.1 and 5.2 T to help with this

module Genre
POP, CLASSIC, JAZZ, ROCK = *1..4
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album
attr_accessor :title, :artist, :genre, :tracks

# complete the missing code:
def initialize (title, artist, genre, tracks)
@title = title
@artist = artist
@genre = genre
@tracks = tracks
end
end

class Track
attr_accessor :name, :location

def initialize (name, location)
@name = name
@location = location
end
end



def read_track(music_file)
name = music_file.gets
location = music_file.gets
track = Track.new(name, location)
return track
end

def read_tracks(music_file)
tracks = Array.new() 
count = music_file.gets().to_i() #3
#tracks = Array.new()
index = 0
while index < count
# track =
#tracks << track
tracks << read_track(music_file) #
index += 1
end
return tracks

end



def print_tracks(tracks)
index = 0
while index < tracks.length
track = tracks[index]
print_track(tracks[index])
index += 1
end
end



def read_album(music_file)


artist = music_file.gets
title = music_file.gets
genre = music_file.gets.chomp.to_i
tracks = read_tracks(music_file)


album = Album.new(title, artist, genre, tracks)
return album
end



def print_album(album)



puts "Title " + album.title
puts "Artist " + album.artist
puts('Genre is ' + album.genre.to_s())
puts($genre_names[album.genre])
print_tracks(album.tracks)

end


def print_track(track)
puts( track.name)
puts( + track.location)
end




def main()
music_file = File.new("album.txt", "r")
album = read_album(music_file)
music_file.close()
print_album(album)
end

main()
