def is_numeric?(obj)
  if /[^0-9]/.match(obj) == nil
    return true
  else 
  return false
end
end 
# takes a number and writes that number to a file then on each line
# increments from zero to the number passe
 # takes a number and writes that number to a file then on each line
# increments from zero to the number passed
def write(number)
  # You might need to fix this next line:
  aFile = File.new("mydata.txt", "w") # open for writing
  aFile.puts(number)
  index = 0
  while (index < number)
   aFile.puts(index.to_s)
   index += 1
  end
  aFile.close()
end
# Read the data from the file and print out each line
def read()
  aFile = File.new("mydata.txt", "r") 
  count = aFile.gets.chomp()
  if (is_numeric?(count))
    count = count.to_i()
  else
    count = 0
  puts "Error: first line of file is not a number"
  end 

  index = 0
  while (index < count)
    line   = aFile.gets
    puts "Line read: " + line 
    index +=1 
  end
  aFile.close()
end

# Write data to a file then read it in and print it out
def main
  write(10)
 read()  
end

# returns true if a string contains only digits

main


