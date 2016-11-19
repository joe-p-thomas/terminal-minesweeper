require_relative 'board.rb'

class Game
  def initialize(size = 10)
    @board = Board.new(size)
    @board.populate_board
  end

  def run
    game_over = false
    until game_over
      game_over = play_turn
    end
  end

  def play_turn

  end

  def make_move(pos, marker = nil)
    @board.place_marker(parse(pos), marker)
  end

  def parse(pos)
    pos.split(",").map { |x| Integer(x) }
  end

  def prompt_player
    "Enter 'F' to place flag. Or enter a position to reveal:"
    move = gets.chomp
    if move == "F" || move == "f"
      prompt_player_flag
    else
      make_move(move)
    end
  end

  def prompt_player_flag
    "Enter position to place flag:"
    move = gets.chomp
    make_move(move, "flag")
  end

end
