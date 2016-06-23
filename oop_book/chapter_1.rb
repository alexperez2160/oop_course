# question 1 
# class Man
#   include
# end 

# bobby = Man.new

# Bobby is an object or instance of the class Man.

# Question 2
# A module is a collection of behaviors that is useable in other classes via mixins.

module Smell 
  def smell(aroma)
    puts "smelling #{aroma}."
  end 
end

class Dog
  include Smell
end 

class Man
  include Smell
end 

bobby = Man.new 
bobby.smell("fart")

spot = Dog.new
spot.smell("doodoo")