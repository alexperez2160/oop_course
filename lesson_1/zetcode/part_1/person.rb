class Person 
  def initialize name 
    @name = name
  end 
  
  def get_name
    @name
  end 
  
end 

per = Person.new "Jane"

puts per.get_name

puts per.send :get_name