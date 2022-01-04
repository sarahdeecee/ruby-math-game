class Player
  
  attr_accessor :name, :lives, :start_lives
  @@number_of_players = 0

  def initialize(num)
    @@number_of_players += 1
    @name = "Player #{num}"
    @lives = 3
    @start_lives = 3
  end

  def self.total_players
    @@number_of_players
  end
end