
require 'Date'

# Fix up the following code that it works and produces the expected output
# in the task specification.

# Asks the user to enter their age and returns an integer age
def get_age()
  puts "Enter your age in years: "
  age = gets.chomp
  return age
end

# takes a prompt and displays it to the user then returns the
# entered string
def get_string(name)
  puts ("Enter your name:")
  name = gets.chomp
  return name
end

# Calculate the year born based on the parameter age and print that out
# along with the name of the user
def print_year(age)
  print_year= Date.today.year -  age.to_i
  puts "You were born in : " +  print_year.to_s 
end

def main
  age = get_age()
  name = get_string(name)
  print_year(age) 
end

main
