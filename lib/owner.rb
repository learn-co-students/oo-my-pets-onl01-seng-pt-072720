class Owner
  attr_reader :species, :name

  @@all = []
  

  def initialize(name)
    @species = "human"
    @name = name
    @@all << self
     
  end

  def say_species
    "I am a #{@species}."
  end
  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  def buy_cat(name)
    cat = Cat.new(name,self)
  end
  def buy_dog(name)
    dog = Dog.new(name,self)
  end
  def walk_dogs
    self.dogs.each {|dog| dog.mood = 'happy'}
  end
  def feed_cats
    self.cats.each {|cat| cat.mood = 'happy'}
  end
  def sell_pets
    pets = []
    pets << self.dogs
    pets << self.cats
    pets.flatten.each do |pet|
      pet.mood = 'nervous'
      pet.owner = nil
    end
  end
  def list_pets
   number_of_dogs = dogs.count
   number_of_cats = cats.count
   "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end
 
 end
 

   