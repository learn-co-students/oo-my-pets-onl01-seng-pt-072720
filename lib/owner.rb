class Owner
@@all = []
attr_reader :name, :species
attr_accessor :cats, :dogs
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
    
  end

  def self.all
    @@all 
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each do |cat|
      self.cats.delete(cat)
      cat.owner = nil
      cat.mood = "nervous"
    end
    self.dogs.each do |dog|
      self.dogs.delete(dog)
      dog.owner = nil
      dog.mood = "nervous"
    end
  end

  def list_pets
   dogs = self.dogs.count
   cats = self.cats.count
   "I have #{dogs} dog(s), and #{cats} cat(s)."
  end
end