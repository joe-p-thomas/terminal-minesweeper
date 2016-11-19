class Board
  attr_reader :board

  def initialize(size = 9)
    @board = Array.new(size) { Array.new(size) }
    self.populate_with_tiles
  end

  def populate_with_tiles
    @board.each_index do |row|
      row.each_index do |col|
        @board[row][col] = Tile.new([row, col])
      end
    end
  end

end
