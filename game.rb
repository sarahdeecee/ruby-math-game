class Game

  REPLY_CORRECT = "YES! You are correct."
  REPLY_INCORRECT = "Seriously? No!"
  NEW_TURN = "----- NEW TURN -----"
  GAME_OVER = "----- GAME OVER -----\nGood bye!"

  attr_accessor :current_player, :answer

  def initialize
    @p1 = Player.new(1)
    @p2 = Player.new(2)
    @current_player = @p1
    self.ask_question
  end

  def declare_winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/#{player.start_lives}"
    puts GAME_OVER
  end

  def declare_score
    puts "P1: #{@p1.lives}/#{@p1.start_lives} vs P2: #{@p2.lives}/#{@p2.start_lives}"
    puts NEW_TURN
  end

  def change_player
    if @current_player == @p1
      @current_player = @p2
    else
      @current_player = @p1
    end
  end

  def ask_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "#{@current_player.name}: What does #{num1} plus #{num2} equal?"
    @player_answer = gets.chomp.to_i
    @correct_answer = num1 + num2
    self.check_answer
  end

  def check_answer
    if @player_answer == @correct_answer
      puts "#{@current_player.name}: #{REPLY_CORRECT}"
    else
      puts "#{@current_player.name}: #{REPLY_INCORRECT}"
      @current_player.lives -= 1
    end
    if @current_player.lives == 0
      self.change_player
      self.declare_winner(@current_player)
    else
      self.declare_score
      self.change_player
      self.ask_question
    end
  end
end