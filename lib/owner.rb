# Owner will know about all their pets, be able to buy a pet,
# change a pet's mood through walking or feeding it, and 
# sell all of their pets.

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name 
    save 
  end 

  def save 
    @@all << self 
  end 

  def species(species = "human")
    @species = species
  end 

  def say_species
    "I am a #{self.species}."
  end 

  def self.all 
    @@all 
  end 

  def self.count 
    self.all.count 
  end 

  def self.reset_all
    self.all.clear
  end 

  def cats 
    Cat.all.select { |cat| cat.owner == self }
  end 

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end 

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end 

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end 

  def walk_dogs
    Dog.all.each { |dog| dog.mood = "happy" }
  end  

  def feed_cats
    Cat.all.each { |cat| cat.mood = "happy" }
  end 

  def sell_pets
    pets = cats + dogs

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end 
  end 

  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 
end

# less intuitive approach on #sell_pets method
# def sell_pets
#   Dog.all.each { |dog| dog.mood = "nervous" }
#   Cat.all.each { |dog| dog.mood = "nervous" }
#   Dog.all.each { |dog| dog.owner = nil }
#   Cat.all.each { |dog| dog.owner = nil }
# end 