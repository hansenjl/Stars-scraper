class Person
  attr_accessor :name, :age, :url, :city, :bio
  @@all = []
  def initialize(name, age, url)
    @name = name
    @age = age
    @url = url
    self.save
  end

  def self.all
     @@all
  end

  def save
    @@all << self
  end
end