require_relative 'board.rb'


class Game
  attr_reader :board

  def initialize(size = 10)
    @board = Board.new(size)
    @board.populate_board
  end

  def run
    until @board.game_lost? || @board.game_won?
      get_input
    end
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


  ###########
  # Needs work
  def get_input
    @board.display
    board.cursor.get_input
    system("clear")
  end

  # def play_turn
  #   input = nil
  #   while input.nil?
  #     input = get_input
  #   end
  #   make_move(@board.cursor.pos, input)
  # end


  def make_move(pos, marker = nil)
    @board.place_marker(pos, marker)
  end

  # def parse(pos)
  #   pos.split(",").map { |x| Integer(x) }
  # end
  #
  # # def prompt_player
  # #   print "Enter 'F' to place flag. Or enter a position to reveal:"
  # #   move = gets.chomp
  # #   if move == "F" || move == "f"
  # #     prompt_player_flag
  # #   else
  # #     make_move(move)
  # #   end
  # # end
  # #
  # # def prompt_player_flag
  # #   print "Enter position to place flag:"
  # #   move = gets.chomp
  # #   make_move(move, "flag")
  # # end

end

game = Game.new(10)
game.run
