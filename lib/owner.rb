class Owner

 attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select do |cat|
      if cat.owner == self
        cat
      end
    end
  end

  def dogs
    Dog.all.select do |dog|
      if dog.owner == self
        dog
      end
    end 
  end

  def buy_cat(for_sale_cat)
    Cat.new(for_sale_cat, self)
  end

  def buy_dog(for_sale_dog)
    Dog.new(for_sale_dog, self)
  end

  def walk_dogs
    self.dogs.each {|a_dog| a_dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|a_cat| a_cat.mood = "happy"}
  end

  def sell_pets
    self.dogs.each do |a_dog|
      a_dog.mood = "nervous"
      a_dog.owner = nil
    end
    self.cats.each do |a_cat|
      a_cat.mood = "nervous"
      a_cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end