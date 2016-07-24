

class MyCar
  
    
  attr_accessor :color 
  attr_reader :year
  
  def self.gas_mileage(gallons, miles)
    puts "#{miles/gallons} miles per gallon of gasoline"
  end 

  
  def initialize(year, model, color)
    @year = year 
    @model = model
    @color = color
    @speed = 0
  end 
  
  def speed_up (num)
    @speed += num
    puts "You speed up by #{num}"
  end 
  
  def slow_down(num)
    @speed -= num
    puts "You decelerate by #{num} mph."
  end 
  
  def turn_off
    @speed = 0
    puts "Let's park this bad boy"
  end 
  
  def current_speed
    puts "You are currently going #{speed} mph"
  end 
  
  def spray_paint(new_color)
    self.color= new_color
  end 
  
  def to_s
    "This is a #{color} #{year} #{@model} going at #{@speed} mph"
  end 
end 


MyCar.gas_mileage(13, 351)

sparky = MyCar.new("1999", "Impala", "yellow")

puts sparky