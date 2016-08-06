class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age+=1
  end
end

alucard = Cat.new("Siamese")

p alucard.make_one_year_older