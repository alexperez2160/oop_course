module Swim
  def swim
    'swimming!'
  end 
end 

class Pet 
end 

class Mammal < Pet
  def run 
    'running'
  end 
  
  def jump
    'jumping'
  end
end 

class Dog < Mammal
  include Swim

  def fetch
    'fetching'
  end 
  
  def speak 
    'bark!'
  end 
  
end 

class Bulldog < Dog
  def swim
    'cant swim'
  end 
end 

class Cat < Mammal
  def speak 
    'meow!'
  end 
end 

class Fish < Pet 
  include Swim
end 


alucard = Cat.new

bob = Fish.new

p Fish.ancestors