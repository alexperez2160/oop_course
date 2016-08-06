module Speak
    def speak(sound)
      puts "#{sound}"
    end 
  end 
  
  class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end 
  
puts "----GoodDog Ancestors---"
puts GoodDog.ancestors
puts ""

puts "-----HumanBeing ancestors_____"
puts HumanBeing.ancestors
sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hello!")
