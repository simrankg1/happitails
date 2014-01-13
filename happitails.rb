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
		print "home:"; home= gets.chomp

		happitails.animals << Animals.new(name, gender, species, age, toys, home)
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
		puts "Choose a client for your animal"
		name= gets.chomp
		# match animal to input
		if happitails.client_names.include?(name)
			puts "I see your client #{name} in our system."
			puts "What animal would #{name} like to adopt?"
			animal_name= gets.chomp
			happitails.animals.each {|x| puts x.name if x.name == animal_name}
			happitails.clients do |x| 
				x.adopt
			end

		else
			puts "I'm sorry, we don't have #{name} in our system."
			print "Client's name: #{name}\n"
			print "Please enter #{name}'s age: "
			age= gets.chomp.to_i
			print "#{name}'s number of children: "
			children= gets.chomp.to_i
			print "#{name}'s number of pets: "
			pets= gets.chomp.to_i 
			happitails.clients << Client.new(name, age, children, pets,)
		
		end

	when "6"
		puts "Which client's pet would you like to adopt?"



	else
		message += "Please try again."
	end

	choice= menu message
end



#happitails.clients.select{|client| client.name = name}[0].pets << animal_name



#selected_animal= Shelter.animals.select {|animal| animals.name == animal}

		#if Shelter.animals.name.include?(animal_name)
		#delete @animal
			#Shelter.animals.delete(animals)
		#prompt user to choose a client 
		#match user input to client array
		#if it doesnt match, say 'sorry this client does not exist'
		#if it matches, add 1 to client pets
		# match response to shelter.animals[] or msg 'sorry invalid'
		# prompt to select @client from shelter.clients[]
		# match response to shelter.clients[] or msg 'sorry invalid'
		# remove @animal from shelter.animals: shelter.animals - 1
		# add @client.pets += 1
		# msg added {animal} to {client}













