class Owner
  # code goes here
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a human."
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
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    pets = []
    pets << self.dogs
    pets << self.cats
    pets.flatten.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

 def list_pets
   number_of_dogs = self.dogs.count
   number_of_cats = self.cats.count
   "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
 end

end