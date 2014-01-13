require './shelter.rb'
require './animals.rb'
require './clients.rb'

happitails = Shelter.new("Happi Tails Shelter")

def menu message

	puts "#{message} \n" unless message.empty? 

	puts '1: Display all animals'
	puts '2: Display all clients'
	puts '3: Create an animal'
	puts '4: Create a client'
	puts '5: Help a client adopt an animal'
	puts '6: Take in an animal'
	puts "q: Quit \n"
	gets.chomp
end

message= ""
choice= menu message
while choice != 'q'
	message = ""
	case choice
	when "1"
		happitails.animals.each do |x|
			message += "#{x.name} is a #{x.age} year old #{x.species} with #{x.toys} toys.\n"
		end
	when "2"
		happitails.clients.each do |x|
			message += "#{x.name} is a #{x.age} year old client with #{x.children} children and #{x.pets} pets.\n"
		end
	when "3"
		puts "Enter animal information:"
		print "name:"; name= gets.chomp
		print "gender:"; gender= gets.chomp
		print "species:"; species= gets.chomp
		print "age:"; age= gets.chomp.to_i
		print "toys:"; toys= gets.chomp
		

		happitails.animals << Animals.new(name, gender, species, age, toys)
		message += "Added animal #{name} the #{species}!"

	when "4"
		puts "Enter client information:"
		print "name"; name= gets.chomp
		print "children"; children= gets.chomp.to_i
		print "age"; age= gets.chomp.to_i
		print "pets"; pets= gets.chomp.to_i

		happitails.clients << Clients.new(name, children, age, pets)
		message += "Added client #{name}!"

	when "5"
		# prompt to select @animal from shelter.animals[]
		puts "Please select a client for the animal: "
		chosen_name= gets.chomp
		# match animal to input
		if happitails.client_names.include?(chosen_name)
			puts "I see your client #{chosen_name} in our system."
			puts "What animal would #{chosen_name} like to adopt?"
			animal_name= gets.chomp

			if animal_name != happitails.animal_names 
				puts "Sorry, we don't have #{animal_name} in our system. Please try again!"

			else
				happitails.animals.delete_if {|x| x.name == animal_name}	#delete @animal from shelter
				happitails.clients.select {|x| x.name = chosen_name}[0].adopt 	#add pet to @client

				message += "#{chosen_name} has officially adopted #{selected_animal}!"
			end
		else
			puts "I'm sorry, we don't have #{chosen_name} in our system. Let me create a new account for your client."
			print "Client's name: #{chosen_name}\n"
			print "Please enter #{chosen_name}'s age: "
			age= gets.chomp.to_i
			print "#{chosen_name}'s number of children: "
			children= gets.chomp.to_i
			print "#{chosen_name}'s number of pets: "
			pets= gets.chomp.to_i 
			happitails.clients << Clients.new(name, age, children, pets,)
		
		end

	when "6"
		puts "Please enter the relevant information for the new addition to the Happy Tails Shelter!"
		puts "Animal name: "
		name_of_animal= gets.chomp
		puts "Animal gender: "
		animal_gender= gets.chomp
		puts "Animal species: "
		animal_species= gets.chomp
		puts "Animal age: "
		animal_age= gets.chomp.to_i
		puts "Number of animal toys: "
		animal_toys= gets.chomp.to_i
		new_animal = Animals.new(name_of_animal, animal_age, animal_gender, animal_species, animal_toys)
		happitails.animals << new_animal
		
		puts "We've entered in #{name_of_animal}'s information, let's get the client in our system now."
		puts "Client's name: "
		name_client= gets.chomp
		puts "Client's age: "
		client_age= gets.chomp.to_i
		puts "Number of children: "
		client_chldren= gets.chomp.to_i
		puts "Number of pets, including #{name_of_animal}: "
		client_pets= gets.chomp.to_i
		new_client = Clients.new(name_client, client_chldren, client_age,  client_pets)

		happitails.clients.push(new_client)

		happitails.clients.select {|x| x.name = name_client}[0].put_up 
		message += "#{name_client} has been added to our database.\nWe're so excited for our new family member, #{name_of_animal} at Happy Tails!"


	else
		message += "Please try again."
	end

	choice= menu message
end















