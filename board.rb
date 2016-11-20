require_relative 'tile.rb'

class Board
  attr_reader :board, :size

  def initialize(size)
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

  def place_marker(pos, marker = nil)
    if marker
      self[pos].change_flag
      false
    else
      self[pos].reveal
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

  def game_won?
    displayed_count = 0
    @board.each do |row|
      row.each do |tile|
        displayed_count += 1 if tile.revealed?
      end
    end
    displayed_count == (@size ** 2) - @size
  end

  def game_lost?
    @board.each do |row|
      row.each do |tile|
        return true if tile.revealed? && tile.bombed?
      end
    end
    false
  end

end
