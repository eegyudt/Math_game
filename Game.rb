require_relative "Player"
require_relative "Question"

class Game

  attr_accessor :current_player

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end
  
  def run
    p "#{@current_player.name}: Enter a number between 1 and 20."
    num = gets.chomp
    num1 = num.to_i
    p "#{@current_player.name}: Enter another number between 1 and 20."
    num = gets.chomp
    num2 = num.to_i
    newQuestion = Question.new(num1, num2)
    p "#{@current_player.name} #{newQuestion.question}?"
    num = gets.chomp
    answer = num.to_i
    game_end = checkAnswer(newQuestion, answer)
    if game_end === false
      run
    end
  end

  def switch_player
    if @current_player === @player1
      @current_player = @player2
    else 
      @current_player = @player1
    end
  end

  def checkAnswer(newQuestion, answer)
    if answer === newQuestion.answer
      puts "correct"
      @current_player.score = @current_player.score + 1
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      switch_player
      return false
    else
      puts "incorrect"
      @current_player.lose_life
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      if @current_player.lives === 0
        puts "----- GAME OVER -----"
        switch_player
        puts "#{@current_player.name} wins with a score of #{@current_player.score}/#{Question.count}"
        return true
      else
        switch_player
        return false
      end
    end
  end
end