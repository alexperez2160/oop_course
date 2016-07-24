

class MyCar
  attr_accessor :color 
  attr_reader :year
  
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
end 


    

impala = MyCar.new("2011", "Impala", "Yellow")

impala.color 

puts impala.color="Blue"
puts impala.color

puts impala.year

puts impala.spray_paint("Black")

puts impala.color