
require './input_functions'

$Id_numbers = [100, 200 ,300]

class Bird
attr_accessor :id, :location, :species, :Cnumber
end 



def read_a_bird()
puts "How many birds are you entering:" 
bird_id = read_string("Enter bird id:")
bird_location = read_string("Enter bird location:")
bird_species = read_string("Enter bird species:")
bird_Cnumber = read_string("Enter bird cage number:")
bird = Bird.new()
bird.id = bird_id
bird.location = bird_location
bird.species = bird_species
bird.Cnumber = bird_Cnumber
 return bird
end



def read_birds()
    index = 0 
    while index < read_a_bird()
        bird = bird[index]
        read_birds(bird[index])
       index += 1 
    end 
end


def print_a_bird(bird)
puts ('Id ' + bird.id)
puts ($Id_numbers[bird.id].to_s)
puts ('Location ' + bird.location)
puts ('Species ' + bird.species)
puts ('Cage number ' + bird.Cnumber)
end

#def print_birds(birds)
#index = 0 
#while index < birds.length 
#bird = bird[index]
#print_a_birds(bird[index])
#index += 1 
#end
#end 

def main()
	birds = read_birds()
    print_birds(birds)
    print_a_bird(bird)
end

main()
