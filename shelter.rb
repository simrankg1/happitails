#Mini Project: happitails shelter 

class Shelter
	
	attr_accessor :clients, :animals ## finish later
	def initialize(name, clients= [], animals= [])
		@clients= clients
		@animals= animals
	end

	# def display_clients
	# 	@clients.each do |x|
	# 		puts x.name
	# end

	# def display_animals
	# 	@animals.each do |x|
	# 		puts x.name
	# end

	def adopt_out_animal(pet)
		@animals.delete(pet)
	end

	def take_in_animal(animal)
		@animals << animal
	end

	def add_clients(client)
		@clients << client
	end

	def client_names
		client_names= []
		@clients.each {|x| client_names << x.name}
		return client_names
	end

	def animal_names
		animal_names= []
		@animals.each {|x| animal_names << x.name}
		return animal_names
	end
end
