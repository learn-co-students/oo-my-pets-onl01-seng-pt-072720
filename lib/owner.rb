class Owner

attr_reader :name, :species

@@all = [] 

def initialize(name, species="human")
  @name = name
  @species = species 
  @@all << self 
end

def say_species
  "I am a #{species}."  
end 

def self.all 
  @@all
end 

def self.count 
  self.all.count 
end 

def self.reset_all 
  @@all = [] 
end 

def cats 
  Cat.all.select {|c| c.owner == self}
end 

def dogs 
  Dog.all.select {|d| d.owner == self}
end 

def buy_cat(cats_name)
  Cat.new(cats_name, self) 
end 

def buy_dog(dogs_name)
  Dog.new(dogs_name, self) 
end 

def walk_dogs
  Dog.all.each {|d| d.mood = "happy"}
end 

def feed_cats
  Cat.all.each {|c| c.mood = "happy"}
end 

def sell_pets
  self.cats.each {|c| c.mood = "nervous"}
  self.dogs.each {|d| d.mood = "nervous"}
  self.cats.each {|c| c.owner = nil}
  self.dogs.each {|d| d.owner = nil}
end 

def list_pets 
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end 


end 