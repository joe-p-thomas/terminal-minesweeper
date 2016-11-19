require_relative 'tile.rb'

class Board
  attr_reader :board, :size

  def initialize(size = 9)
    @size = size
    @board = Array.new(size) { Array.new(size) }
  end

  def populate_board
    @board.each_with_index do |arr, row|
      arr.each_index do |col|
        @board[row][col] = Tile.new([row, col], self)
      end
    end
    place_bombs
  end

  def place_bombs
    positions = []
    while positions.count < @board.length
      pos = [rand(@board.size), rand(@board.size)]
      unless positions.include?(pos)
        @board[pos.first][pos.last].place_bomb
        positions << pos
      end
    end
  end

  def [](pos)
    row = pos.first
    col = pos.last
    @board[row][col]
  end

  def display
    @board.each do |row|
      row.each do |tile|
        print tile.display
      end
      puts ""
    end
  end

end

board = Board.new(20)
board.populate_board

board.display
