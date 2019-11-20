class Person
  attr_accessor :name, :age
  @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    self.save
  end

  def self.all
     @@all
  end

  def save
    @@all << self
  end
end