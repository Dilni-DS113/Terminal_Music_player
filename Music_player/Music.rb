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
  
$fileName # opened file 
$albumCount # How many albums are in the file  



def open_file()
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  user = read_string("Enter File name: ")
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  a_file = File.new(user, "r") # open for reading
  albums = read_albums(a_file)
  $fileName = user
  puts "Loading file....."
  sleep 2 
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
    sleep 0.80
  print_albums(albums)
  when 2 
    look = read_integer("Enter Genre number:  ")
    sleep 0.80
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
sleep 0.80
end


def Play_Album(albums)
finished = false
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
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
 song_playing(songs,music)
print "Playing Selected Song...."
 puts ("!-! !-! !-! !-! !-! !-!")
sleep 2 
puts ("                      ")
puts "****Song Ended****" 
when 2 
play = read_string("Enter Album Name: ")
search_Album(albums,play)
puts "Playing Selected Album...."
  puts ("!-! !-! !-! !-! !-! !-!")
sleep 2 
puts "****Song Ended****" 
when 3 
  finished = true
else 
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
   puts "Please Select option again :( "
   puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
end 
end until finished
puts("Loading Main Menu.....")
sleep 2 
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
      end
    index += 1 
  end 
  if (index > songs.length)
    puts "Song not in album"
  end 
end 




def Edit_album(albums)
finished = true 
begin 
  puts ("                           ")
  puts "****Edit Album Menu****"
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
puts "1-Select Album To edit"
puts "2-Back To Main Menu"
puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
choice = read_integer_in_range("Select Menu choice  ",1,4)
puts ("                           ")
case choice
#===========================================================================
when 1 
number = read_integer("Enter Album ID No. : ")
index = search_number(albums,number)
if (index == -1)
puts "Selected Album is not found"
else 
  puts ("                           ")
 puts ("What would you like to edit? :  ") 
 puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  puts "1-Edit Title "
  puts "2-Edit genre"
  puts "3-Edit Artist Name "
  puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  edit = read_integer("Select Menu choice  ");
  case edit
  when 1 
    puts "Current Album Title: " + albums[index].title
    newT = read_string("Enter New Ttile: ") 
   albums[index].title = newT
  when 2 
    puts "Current Album Genre: " + albums[index].genre.to_s
    newG = read_integer("Enter New Genre: ") 
   albums[index].genre = newG
  when 3 
    puts "Current Album Artist Name: " + albums[index].artist
    newA = read_string("Enter New Ttile: ") 
   albums[index].artist = newA
  when 4 
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
  sleep 2 
  return albums 
end 
#===========================================================================

def search_number(albums,number)
 index = 0 
 while index < albums.length
  album = albums[index]
  if (album.id.to_i == number)
    return index  # postion of the Album ID is printed 
  end 
  index +=1 
end 
return -1 
end  

def NewSongs(fileUpdate,songs)
 index = 0 

 while (index < songs.length)
  fileUpdate.puts songs[index].name
  fileUpdate.puts songs[index].location
  index += 1 
 end 

end 

def New_change(albums)
 fileUpdate = File.open($fileName,"w")
 fileUpdate.puts $albumCount
 index = 0 
 while (index < albums.length)
  fileUpdate.puts albums[index].artist
  fileUpdate.puts albums[index].title
  fileUpdate.puts albums[index].image
  fileUpdate.puts albums[index].genre
  fileUpdate.puts albums[index].songs.length.to_s
  NewSongs(fileUpdate, albums[index].songs)
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
    albumx = Edit_album(albums)
    puts ("****Saving Change****")
    sleep 2 
    puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    New_change(albumx)
  when 5
   finished = true 
   else 
    puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
   puts "Please Select Option again :(  "
   puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
 end 
 end until finished
 puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
 puts("****Shutting Down Programm****")
 puts ("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
 sleep 2 
 end 
 
 main()