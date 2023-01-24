class Player
  
  attr_accessor :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def lose_life
    @lives -= 1
  end
end
