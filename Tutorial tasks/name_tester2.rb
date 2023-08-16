require './input_functions'

# you need to complete the following procedure that prints out 
# "<Name> is a " then print 'silly' (60 times) on one long line
# then print ' name.' \newline

def print_silly_name(name)
	puts (name + " is a ")
	index = 0 
	while index < 60  do
		print (" silly ")
		index = index + 1 
	end
	puts (" name !")
end

def main ()
	name = read_string("what is your name ?")
	if (name == "Dilni") or (name == "Zafarayab")
		puts (name + " is an awesome name!")
	else 
	    print_silly_name(name)
   end 
end 



main
