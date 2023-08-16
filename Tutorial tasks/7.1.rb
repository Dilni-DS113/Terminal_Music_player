require './input_functions'
 
class Display 
   attr_accessor :name, :artist, :genre
end 

def Display_Albums()
   finished = false 
  begin 
   puts "Play Menu "
   puts "1-Main Menu "
   puts "2-Enter Another Album "
   choice = read_integer_in_range("Select Play Menu Choice ",1,2)
   case choice
   when 1 
   main()
   when 2 
   album = read_album()
   finished = true
   else 
      puts "Please Select option: "
  end 
 end until finished
read_string("Press enter to continue:")

end  

def read_album(albums)
   tracks = read_tracks(a_file)
   album = Album.new()
   album.name= a_file.gets 
   album.artist= a_file.gets
   album.genre= a_file.gets
  return album
end 

def read_albums(albums)
  index = 0 
  count = album.gets.chomp 
  albums = Array.new()
 while index < count
   album = read_album(albums) 
   albums << album
   index +=1
 end
   return albums
end 



def Run_album(album)
   puts ("Albums saved in program: ")
   puts (album.name)
   puts (album.artist)
   puts (album.genre)
end 

def Run_albums(albums)
   index = 0 
   while index < albums.length
   Run_album(albums[index])
      index +=1 
   end 
end


def main()
   user = read_string("Enter File name....")
   a_file = File.new(user, "r") # open for reading
   
finished = false
   begin 
   puts "Main menu"
  puts "1-Display Albums" # all 
  puts "2-Run Album" # User / sespesic 
  puts "3-Exit "
choice = read_integer_in_range("Select Menu choice  ",1,3)
case choice 
 when 1
Display_Albums()
 when 2   
Run_albums(albums) 
 when 3 
  finished = true 
  else 
  puts "Please Select Option again: "
end 
end until finished
puts("Shutting Down Programm ")


end 

main()



   