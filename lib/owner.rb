require 'pry'

class Owner
  attr_reader :name, :species

@@all = []

  def initialize(name, species= "human")
    @name = name
    @species = species
    save
  end

  def save
    @@all << self
  end


  def say_species
    "I am a #{species}."
  end


def self.all
  @@all
end

def self.count
  @@all.length
end

def self.reset_all
  @@all.clear
end

def cats
  Cat.all.select {|temp| temp.owner == self}
end

def dogs
  Dog.all.select {|temp| temp.owner == self}
end

def buy_cat (cat_name)
  cat_name = Cat.new(cat_name, self)
end

def buy_dog (dog_name)
  dog_name = Dog.new(dog_name, self)
end

def walk_dogs
  owner_dogs = dogs
  dogs.each do |temp|
    temp.mood = "happy"
  end
end

  def feed_cats
    owner_cats = cats
    cats.each do |temp|
      temp.mood = "happy"
    end
  end

def sell_pets
  owner_pets = self.dogs + self.cats
  owner_pets.each do |temp|
    temp.mood = "nervous"
    temp.owner = nil
  end
end

def list_pets
  number_of_dogs = dogs.length
  number_of_cats = cats.length
  "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
end



end
