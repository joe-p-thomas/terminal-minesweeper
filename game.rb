require_relative 'board.rb'

class Game
  attr_reader :board

  def initialize(size = 10)
    @board = Board.new(size)
    @board.populate_board
  end

  def run
    system("clear")
    until @board.game_lost? || @board.game_won?
      get_input
    end
    display_results

  end

  def display_results
    system("clear")
    if @board.game_lost?
      @board.reveal_bombs
      @board.display
      puts "Sorry, you lose"
    else
      @board.display
      puts "Congrates, you win!"
    end
  end

  def get_input
    @board.display
    board.cursor.get_input
    system("clear")
  end

  def make_move(pos, marker = nil)
    @board.place_marker(pos, marker)
  end

end

game = Game.new(10)
game.run
