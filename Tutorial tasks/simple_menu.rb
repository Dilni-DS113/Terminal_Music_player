require './input_functions'
def Update_Album_Genre
end 
def maintain_albums()
  finished = false
  begin

  puts 'sub Menu'
  puts '1 To Update Album Title '
  puts '2 To Update Album Genre'
  puts '3 To Enter Album'
  puts '4 Return to the Main Menu'
  choice = read_integer_in_range("Please enter your choice:", 1, 4)
  case choice
  when 1 
    puts "You've selected To Update Album Title"
  when 2 
    play_existing_album()
  when 3 
    print "You've selected To Enter Album"
    when 4 
      finished = true 
    else 
      puts 'please select again'
    end 
  end until finished
  puts 'You selected Enter or Update New Album'
  read_string("Press enter to continue")
end 


def play_existing_album()
  puts "You selected Play Existing Album. Press enter to continue"
  gets
end

# complete the case statement below and
# add a stub like the one above for option 2
# of this main menu
def main()
  finished = false
  begin
    puts 'Main Menu:'
    puts '1 To Enter or Update Album'
    puts '2 To Play existing Album'
    puts '3 Exit'
    choice = read_integer_in_range("Please enter your choice:", 1, 3)
    case choice
    when 1
      maintain_albums()
    when 2
      play_existing_album()
    when 3 
      finished = true
    else
      puts 'Please select again'
    end
  end until finished
  puts 'You Selected Enter or Update New Album'
  read_string("Press enter to continue")
end


main()
