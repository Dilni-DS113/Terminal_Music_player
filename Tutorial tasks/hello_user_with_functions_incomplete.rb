require 'date'
require './input_functions'

# Multiply metres by the following to get inches:
INCHES = 39.3701

# Insert into the following your hello_user code
# from task 1.3P and modify it to use the functions
# in input_functions

def main()

  # HOW TO USE THE input_functions CODE
  # Example of how to read strings:

  s = read_string('Please enter your name : ')
  puts "Your name is  " + s + "!" 

  b = read_string('Please enter your family name : ')
  puts "Your family name is  " + b + "!" 

  # Example of how to read integers:

  i = read_integer('What year were you born ? : ')
  puts " Your year of birth is : " + i.to_s
  age = Date.today.year - i.to_i
  puts "So you are " + age.to_s + "years old"
  
  # Example of how to read floats:
  puts 'Enter your height in metres:'
	height = gets.to_f
	height = height * INCHES
	puts 'Your height in inches is: '
	puts height.to_s
  puts "Finished"

  read_boolean 'Do you want to continue?'
    if 'yes' 
      puts "ok"
    else 
     puts "goodbye"
    end
  
end

main()
