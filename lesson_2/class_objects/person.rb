class Person
  attr_accessor :first_name, :last_name
  
  def initialize(fullname)
    parse_full_name(fullname)
  end 
  
  def name
    "#{first_name} #{last_name}".strip
  end 
  
  def name=(fullname)
    parse_full_name(fullname)
  end 
  
  def to_s
    name 
  end 
  
  private 
  
  def parse_full_name(fullname)
    parts = fullname.split 
    self.first_name = parts.first 
    self.last_name = parts.size > 1 ? parts.last : ''
  end 
  
end 

bob= Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob !~ rob

p bob.name == rob.name

puts "The person's name is: #{bob}"