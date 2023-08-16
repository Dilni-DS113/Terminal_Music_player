def read_array()
  text_array = Array.new()
    print ("How many lines are you entering? ")
    count = gets.to_i
    index = 0 
    while index < count
  print "Enter text: " 
    text_array << gets.chomp
    index += 1 
  end
  return text_array
  end 
  
  def print_array(text_array)
  index = 0 
  while index < text_array.length 
  puts index.to_s + " " +text_array[index]  
  index += 1  
  end 
    end 
  
  
  def main()
  text_array = read_array()
  puts "Printing lines:"
  print_array(text_array)
  
      
  
  end
  
  main()