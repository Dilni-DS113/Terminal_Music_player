require './input_functions'

class Flight
	attr_accessor :id, :name, :airport, :destination
	end 

def read_flight()
flight_id = read_string("Enter plane id:")
flight_name = read_string("Enter flight name:")
flight_airport = read_string("Enter origin airpot:")
flight_destination= read_string("Enter destination airport:")
 flight = Flight.new()
flight.id = flight_id
flight.name = flight_name
flight.airport = flight_airport
flight.destination = flight_destination
 return flight
end

def read_flights()
	index = 0 
	count = read_integer("how many flights are you entering:") 
	flights = Array.new()
    while index < count 
        flight = read_flight
        flights << flight 
       index += 1 
    end 
	return flights 
end

def print_flight(flight)
	puts('Flight information is:')
puts ('Id: ' + flight.id.to_s)
puts ('Name: ' + flight.name )
puts ('Airport: ' + flight.airport )
puts ('Destination: ' + flight.destination )
end

def print_flights(flights)
index = 0 
while index < flights.length 
print_flight(flights[index])
index += 1 
end
end 

def main()
	flights = read_flights()
	print_flights(flights)
end

main()