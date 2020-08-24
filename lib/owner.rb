class Owner
  
  attr_reader :name, :species
  attr_accessor 

  @@all = []

  def initialize(name)
    @name = name 
    @species = "human" 
    save
  end

  def save 
    self.class.all << self 
  end

  def self.all 
    @@all
  end

  def say_species
    return "I am a #{@species}." 
  end

  def self.count 
    @@all.length
  end

  def self.reset_all 
    @@all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs 
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil 
    end
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil 
    end
    self.dogs.clear
    self.cats.clear 
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


end