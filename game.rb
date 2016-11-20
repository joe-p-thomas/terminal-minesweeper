require_relative 'board.rb'

class Game
  attr_reader :board

  def initialize(size = 10)
    @board = Board.new(size)
    @board.populate_board
  end

  def run
    until @board.game_lost? || @board.game_won?
      play_turn
    end
    system("clear")
    @board.display
    if @board.game_lost?
      puts "Sorry, you lose"
    else
      puts "Congrates, you win!"
    end
  end

  def play_turn
    system("clear")
    @board.display
    prompt_player
  end

  def make_move(pos, marker = nil)
    @board.place_marker(parse(pos), marker)
  end

  def parse(pos)
    pos.split(",").map { |x| Integer(x) }
  end

  def prompt_player
    print "Enter 'F' to place flag. Or enter a position to reveal:"
    move = gets.chomp
    if move == "F" || move == "f"
      prompt_player_flag
    else
      make_move(move)
    end
  end

  def prompt_player_flag
    print "Enter position to place flag:"
    move = gets.chomp
    make_move(move, "flag")
  end

end

game = Game.new
game.run
