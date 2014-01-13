class Clients
	
	attr_accessor :name, :children, :age, :pets
	def initialize(name, children, age, pets= [])
		@name= name
		@children= children
		@age= age
		@pets= pets

	end

	def adopt
		@pets += 1
	end

	def put_up
		@pets -= 1
	end


end
