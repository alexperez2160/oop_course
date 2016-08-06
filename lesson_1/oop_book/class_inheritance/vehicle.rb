module HeavyDutyable
  def four_by_four? 
    true 
  end 
end 

class Vehicle 
  attr_accessor :color , :year 
  @@number_of_vehicles = 0 
  
  def initialize(year, model, color)
    @year = year 
    @model = model
    @color = color
    @speed = 0
    @@number_of_vehicles += 1
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
  
  def num_of_vehicles
    p @@number_of_vehicles
  end 
  
  def disclose_age
    puts "I am #{age} years old"
  end 
  
  private
  def age
   t= Time.now.year- Time.new(self.year).year
  end
end 

class MyCar < Vehicle 
  STAINED = true 
end 

class MyTruck < Vehicle
  COVERED_BED = false 
  include HeavyDutyable
  
  def has_a_coveredbed? 
    p COVERED_BED
  end
  
end 



f150 = MyTruck.new(2017, "F150", "Silver")

silverado = MyTruck.new(2016, "Silverado", "Black" )


sparky = MyCar.new(2013, "Chevy", "Blue")

sparky.disclose_age