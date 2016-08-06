class Some 
  
  def initialize 
    method1
    self.method1
  end 
  
   protected
  
  def method1
    puts "private method1 called"
  end 
  
end 

s = Some.new
s.method1
