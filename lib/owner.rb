require "pry"
class Owner
  attr_accessor :owner 
  attr_reader :name, :species
  @@all = []
  def initialize(name, species = "human")
    @name = name
    @species = species
    self.owner = self.name
    @@all << self
  end
  def say_species
    "I am a #{self.species}."
  end  
  def self.all
    @@all
  end
  def self.count
    @@all.size
  end
  def self.reset_all 
    @@all.clear
  end
  def cats
    Cat.all.select {|c| c.owner == self}
  end
  def dogs
    Dog.all.select {|d| d.owner == self}
  end
  def buy_cat(cat)
    Cat.all.find {|c| c.name == cat}.owner = self
  end
  def buy_dog(dog) 
    Dog.all.find {|d| d.name == dog}.owner = self
  end
  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end
  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
    
  end
  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
    end
    self.dogs.each do |dog|
      dog.mood = "nervous"
    end
    self.cats.each do |cat|
      cat.owner = nil
    end
    self.dogs.each do |dog|
      dog.owner = nil
    end
  end
  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end
end
