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
      if dog.owner.name == self.name
        all_dogs << dog
      end
    end
    all_dogs
  end

  def cats
    all_cats = []
    Cat.all.each do | cat |
      if cat.owner.name == self.name
        all_cats << cat
      end
    end
    all_cats
  end

  def buy_cat(name)
      cat = Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.all.each do | dog |
       if dog.name == name
          dog.owner.name = self.name
       else
          dog = Dog.new(name, self)
       end
    end
  end

  def feed_cats
    Cat.all.each do | cat |
      if cat.owner.name == self.name
        cat.mood = "happy"
      end
    end
  end

  def walk_dogs
    Dog.all.each do | dog |
      if dog.owner.name == self.name
        dog.mood = "happy"
      end
    end
  end

  def sell_pets
    Dog.all.each do | dog |
      if dog.owner.name == self.name
        dog.owner = nil
        dog.mood = "nervous"
      end
    end

    Cat.all.each do | cat |
      if cat.owner.name == self.name
        cat.owner = nil
        cat.mood = "nervous"
      end
    end
  end

  def list_pets
    "I have #{ self.dogs.count } dog(s), and #{ self.cats.count } cat(s)."
  end
end