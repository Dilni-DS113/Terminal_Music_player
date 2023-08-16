require './input_functions'

# you need to complete the following procedure that prints out 
# "<Name> is a " then print 'silly' (60 times) on one long line
# then print ' name.' \newline

def main () 
name = read_string ("What is your name ?")
if (name == "Dilni") or (name == "Zafarayab")
puts (name + " is an awesome name!")
else 
puts (name + " is a " + "silly" + "name" )
  end 
end


main()
