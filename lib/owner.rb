class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def dogs
    all_dogs = []
    Dog.all.each do | dog |
      if dog.owner == self
        all_dogs << dog
      end
    end
    all_dogs
  end

  def cats
    all_cats = []
    Cat.all.each do | cat |
      if cat.owner == self
        all_cats << cat
      end
    end
    all_cats
  end

  def buy_cat(name)
      cat = Cat.new(name, self)
  end

  def buy_dog(name)
      dog = Dog.new(name, self)
  end

  def feed_cats
    Cat.all.each do | cat |
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end

  def walk_dogs
    Dog.all.each do | dog |
      if dog.owner == self
        dog.mood = "happy"
      end
    end
  end

  def sell_pets
    Dog.all.each do | dog |
      if dog.owner == self
        dog.owner = nil
        dog.mood = "nervous"
      end
    end

    Cat.all.each do | cat |
      if cat.owner == self
        cat.owner = nil
        cat.mood = "nervous"
      end
    end
  end

  def list_pets
    "I have #{ self.dogs.count } dog(s), and #{ self.cats.count } cat(s)."
  end
end