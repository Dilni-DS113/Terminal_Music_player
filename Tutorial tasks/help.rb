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
  attr_accessor :title , :artist ,:genre, :songs ,:image , :id 

 def initialize (title, artist, image , genre, songs , id)
  @title = title
  @artist = artist
  @image = image
  @genre = genre
  @songs = songs
  @id = id 
  end
end 

#variables to store file name and count of albums
$fileName
$albumCount
 
 def open_file()
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  user = read_string("Enter File name: ")
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  a_file = File.new(user, "r") # open for reading
  $fileName = a_file
  albums = read_albums(a_file)
  puts "Loading file....."
  puts "File Opened :)"
  return albums
end 

def Display_Albums(albums)
  finished = false 
 begin 
  puts ("                             ")
  puts "****Display file menu****"
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  puts "1-All Albums" # print the entire file 
  puts "2-Display Album By Genre " # Prints by Genre 
  puts "3-Returns to Main Menu " # Back to main menu 
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  choice = read_integer_in_range("Select Display Menu Choice: ",1,3)
  puts ("                      ")
  case choice
  when 1 
  print_albums(albums)
  when 2 
    look = read_integer("Enter Genre number:  ")
  Look_genre(albums,look)
  when 3
  finished = true
  else 
    puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
     puts "Please Select option again :( "
     puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  end 
end until finished
puts("Loading Main Menu.....")
end

def Play_Album(albums)
finished = true 
begin
  puts ("                        ")
puts "****Play Album****"
puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
puts "1-Play Album by ID" 
puts "2-Search For an Album  "
puts "3-Back To Main Menu"
puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
choice = read_integer_in_range("Select Play Menu Choice: ",1,3)
puts ("                      ")
case choice
when 1 
  search = read_integer("Enter ID No. :  ")
  songs = search_ID(albums,search)
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  music = read_string("Enter song Name: ")
 song_playing(songs,music)

when 2 
play = read_string("Enter Album Name: ")
search_Album(albums,play)
print "Playing Selected Album...."
  puts ("!-! !-! !-! !-! !-! !-!")

when 3 
  finished = true
else 
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
   puts "Please Select option again :( "
   puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end 
end until finished
puts("Loading Main Menu.....")
end 

def Look_genre(albums,look)
  index = 0 
  while index < albums.length
   album = albums[index]
      if (album.genre.to_i== look)
        print_album(albums[index])
      end
    index += 1 
  end 
end  

def read_album(a_file,index)
  artist = a_file.gets
  id = index 
  title = a_file.gets
  image = a_file.gets
  genre = a_file.gets.chomp.to_i
  songs = read_songs(a_file)
  album = Album.new(title, artist,image, genre, songs, id)
  return album
end

def read_albums(albums)
 index = 0 
 count = albums.gets.chomp.to_i
 $albumCount = count
 albumtemp = Array.new()
 while index < count
  albumx = read_album(albums,index) 
  albumtemp << albumx
  index +=1
 end 
 return albumtemp
end 

def read_song(a_file)
  name = a_file.gets 
  location = a_file.gets 
  song = Song.new(name,location ) 
  return song
end

def read_songs(a_file)   # read the number of songs this call the read song x number of times 
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
    song = songs[index]
  print_song(songs[index])
  index += 1 
  end 
end

def print_song(song)
puts(song.name)
puts(song.location)
end 


def print_album(album)
  puts ("                           ")
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  puts "Title: " + album.title
  puts "Artist: " + album.artist
  puts "Album cover: " + album.image
  puts'Genre is: ' + ($genre_names[album.genre].to_s)
  puts "ID is: " + album.id.to_s
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
 print_songs(album.songs)
end 

def print_albums(albums)
  index = 0 
  while index < albums.length
    album = albums[index]
    print_album(albums[index])
    index += 1 
  end 
end 

def search_Album(albums,play)
  index = 0 
  while index < albums.length
   album = albums[index]
      if (album.title.strip == play)
        print_album(albums[index])
      end
    index += 1 
  end 
end 


def search_ID(albums,search)
  index = 0 
  while index < albums.length
   album = albums[index]
      if (album.id.to_i == search)
        print_album(albums[index])
		return albums[index].songs
      end
    index += 1 
  end 
end 

def song_playing(songs,music)
  index = 0 
  while index < songs.length
   song = songs[index]
      if (song.name.strip == music)
        print_song(songs[index])
		break
      end
    index += 1 
  end 
  if(index > songs.length)
	puts "Sorry song not found"
  end
end 

def Edit_Album(albums)
finished = true 
begin
	puts ("                        ")
	puts "****Edit Album****"
	puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	puts "1-Search Album by ID" 
	puts "2-Search Album by Name "
	puts "3-Back To Main Menu"
	puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
	choice = read_integer_in_range("Select Play Menu Choice: ",1,3)
	puts ("                      ")
	case choice
		when 1 
			search = read_integer("Enter ID No. :  ")
			index = search_AlbumID(albums,search)
			if(index == -1)
				puts "Album ID not found"
			else
				puts "1 - edit Album title "
				puts "2 - edit Artist Name"
				editOption = read_integer("Enter your choice ");
				case editOption
					when 1
						puts "current album title " + albums[index].title
						newTitle = read_string("Enter the new title")
						albums[index].title = newTitle
					when 2 
						#code for edit artist name 
					when 3 
					finished = true
					else 
						puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
						puts "Please Select option again :( "
						puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
				end 
			end
	end
end until finished
puts("Loading Main Menu.....")
return albums
end

def search_AlbumID(albums,search)
index = 0 
  while index < albums.length
   album = albums[index]
      if (album.id.to_i == search)
	     return index
	  end
    index += 1 
  end 
  return -1
end 


def writeToFileSongs(fileUpdate, songs)
	index = 0
	
	while (index < songs.length)
		fileUpdate.puts songs[index].name
		fileUpdate.puts songs[index].location
		index += 1
	end
end

def writeToFileAlbums(albums)
	fileUpdate = File.open($fileName,"w")
	fileUpdate.puts $albumCount
		index = 0
	while (index < albums.length)
		fileUpdate.puts albums[index].artist
		fileUpdate.puts albums[index].title
		fileUpdate.puts albums[index].image
		fileUpdate.puts albums[index].genre
		fileUpdate.puts albums[index].songs.length.to_s
		writeToFileSongs(fileUpdate, albums[index].songs)
		index += 1
	end
end

def main()
	finished = false
	begin 
		puts ("                           ")
		puts "****Main menu****"
		puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		puts "1-Open File"  # initiliase the file Option 1 
		puts "2-Display Album" # Opens / Displays the whole file 
		puts "3-Play a Album" # use search function to select song ---> fix this with id 
		puts "4-Edit Album in a selected file" # option 4 which should update the file 
		puts "5-Exit" #Shutting Down the Program 
		puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		choice = read_integer_in_range("Select Menu choice  ",1,5)
		puts ("                           ")
		case choice 
			when 1
				albums =  open_file()
			when 2   
				Display_Albums(albums)
			when 3 
				Play_Album(albums)
			when 4
				albumx=Edit_Album(albums)
				puts("****Saving file****")
				puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
				writeToFileAlbums(albumx)
				
			when 5
				finished = true 
			else 
				puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
				puts "Please Select Option again :(  "
				puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
		end 
	end until finished
	puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end 
 
 main()