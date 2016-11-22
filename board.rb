require_relative 'tile.rb'
require_relative 'cursor.rb'


class Board
  attr_reader :board, :size, :cursor

  def initialize(size)
    @size = size
    @board = Array.new(size) { Array.new(size) }
    @bomb_count = size
    @bomb_positions = []
    @cursor = Cursor.new([0, 0], self)
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
    while @bomb_positions.count < @bomb_count
      pos = [rand(@board.size), rand(@board.size)]
      unless @bomb_positions.include?(pos)
        @board[pos.first][pos.last].place_bomb
        @bomb_positions << pos
      end
    end
  end

  def reveal_bombs
    @bomb_positions.each do |pos|
      self[pos].force_reveal
    end
  end

  def place_marker(pos, marker)
    case marker
    when :flag
      self[pos].change_flag
      false
    when :reveal
      self[pos].reveal
    end
  end

  def [](pos)
    row = pos.first
    col = pos.last
    @board[row][col]
  end

  def display
    @board.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        if @cursor.pos == [i, j]
          print tile.display.colorize(:background => :light_green) + " "
        else
          print tile.display + " "
        end
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
    displayed_count == (@size**2) - @bomb_count
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
