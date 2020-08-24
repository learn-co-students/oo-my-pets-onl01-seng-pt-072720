require "pry"

class Owner
  # code goes here
  attr_accessor :pets
  attr_reader :species, :name

  @@all = []
  

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:dogs => [], :cats => []}
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name, self)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  # def sell_pets
  #   pets.each do |key, value|
  #     value.each do |pet|
  #       pet.mood = "nervous"
  #       pet.owner = nil
  #     end
  #   end
  #   pets.clear
  # end
  def sell_pets
    all_pets = self.cats + self.dogs
    all_pets.each do |pet|
        sell_pet(pet)
    end
end

def sell_pet(pet)
    pet.owner = nil
    pet.mood = "nervous"
end
# binding.pry

def list_pets
  "I have #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
end

end