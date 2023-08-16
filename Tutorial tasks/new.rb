require './input_functions'
class Song
attr_accessor :name,:location

def initialize (name,location)
@name = name
@location = location
end
end

module Genre
POP, CLASSIC, JAZZ, ROCK = *1..4
end


$genre_names = ['null', 'Pop', 'Classic', 'Jazz', 'Rock']


class Album
attr_accessor :title , :artist ,:genre, :songs ,:image

def initialize (title, artist, image , genre, songs)
@title = title
@artist = artist
@image = image
@genre = genre
@songs = songs
end
end

def open_file()
user = read_string("Enter File name....")
a_file = File.new(user, "r") # open for reading
albums = read_albums(a_file)
puts "Loading file....."
puts "File Opened :)"
return albums
end

def Display_Albums(albums)
finished = false
begin
puts "Display file menu "
puts "1-All Albums"
puts "2-Songs Name "
puts "3-Exit "
choice = read_integer_in_range("Select Play Menu Choice ",1,3)
case choice
when 1
print_albums(albums)
when 2

when 3
finished = true
else
puts "Please Select option again : "
end
end until finished
puts("Shutting Down Programm ")
end

def read_album(a_file)
artist = a_file.gets
title = a_file.gets
image = a_file.gets
genre = a_file.gets.chomp.to_i
songs = read_songs(a_file)
album = Album.new(title, artist,image, genre, songs)
return album
end

def read_albums(albums)
index = 0
count = albums.gets.chomp.to_i
albumtemp = Array.new()
while index < count
albumx = read_album(albums)
albumtemp << albumx
index +=1
end
return albumtemp
end

def read_song(a_file)
name = a_file.gets
location = a_file.gets
song = Song.new(name,location)
return song
end

def read_songs(a_file) # read the number of songs this call the readsong x number of times
songs = Array.new()
count = a_file.gets().to_i()
index = 0
while index < count
songs << read_song(a_file)
index += 1
end
return songs
end


def print_songs(songs)
index = 0
while index < songs.length
#song = songs[index]
print_song(songs[index])
index += 1
end
end

def print_song(song)
puts(song.name)
puts(song.location)
end


def print_album(album)
puts "Title " + album.title
puts "Artist " + album.artist
puts "Album cover: " + album.image
puts'Genre is ' + album.genre.to_s
print_songs(album.songs)
end

def search_albums(albums, searchTitle)
index = 0
while index < albums.length
album = albums[index]
if (album.title.strip == searchTitle)
print_album(albums[index])
end

index += 1
end
end



def print_albums(albums)
index = 0
while index < albums.length
album = albums[index]
print_album(albums[index])
index += 1
end
end

def main()
finished = false
begin
puts "Main menu"
puts "1-Open File"
puts "2-Display Album"
puts "3-Run and Play a Album"
puts "4-Edit Album in a selected file"
puts "5-Exit"
choice = read_integer_in_range("Select Menu choice ",1,5)
case choice
when 1
albums = open_file()
when 2
Display_Albums(albums)
when 3
searchTitle = read_string("Enter the name of the album")
search_albums(albums, searchTitle)
when 4

when 5
finished = true
else
puts "Please Select Option again: "
end
end until finished
puts("Shutting Down Programm ")

end

main()