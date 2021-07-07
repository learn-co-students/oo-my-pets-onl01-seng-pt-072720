#require 'pry'
class Owner
  attr_reader :species, :name

  @@all_owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all_owners << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all_owners
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all_owners.clear
  end

  def cats
    Cat.all.select { |o| o.owner == self }
  end

  def dogs
    Dog.all.select { |o| o.owner == self }
  end

#  binding.pry

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each { |d| d.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |c| c.mood = "happy" }
  end

  def sell_pets
    self.cats.each { |c| c.mood = "nervous" }
    self.dogs.each { |d| d.mood = "nervous" }
    self.cats.each { |c| c.owner = nil }
    self.dogs.each { |d| d.owner = nil }
  end

  def list_pets
    return "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

end
