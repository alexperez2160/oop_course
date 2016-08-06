class Car 
  attr_reader :name, :price
  attr_writer :name , :price 
  
  def to_s 
    "#{@name}: #{@price}"
  end 
  
end 

c1 = Car.new
c2 = Car.new

c1.name = "Porsche" 
c1.price = 9500

puts "The #{c1.name} costs #{c1.price}"

p c1
p c2