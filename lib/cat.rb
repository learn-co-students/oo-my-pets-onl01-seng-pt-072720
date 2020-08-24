class Cat

  attr_reader :name
  attr_accessor :mood, :owner

  @@all = []
  
  def initialize(name, owner)
    @name = name 
    @owner = owner 
    @mood = "nervous"
    save 
  end

  def self.all
    @@all
  end

  def save 
    self.class.all << self
  end

  def owner=(new_owner)
    @owner = new_owner
  end

  def mood=(mood)
    @mood = mood
  end




  

end