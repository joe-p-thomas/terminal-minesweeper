class Tile
  attr_reader :pos
  attr_accessor :revealed
  def initialize(pos, board)
    @pos = pos
    @board = board

    @bombed = false
    @bombed_neighbors = 0
    @flagged = false
    @revealed = false
  end

  def place_bomb
    @bombed = true
    neighbor_pos.each do |pos|
      @board[pos].add_bombed_neighbor
    end
  end

  def add_bombed_neighbor
    @bombed_neighbors += 1
  end

  def bombed?
    @bombed
  end

  def change_flag
    if @flagged
      @flagged = false
    else
      @flagged = true
    end
  end

  def flagged?
    @flagged
  end

  def display
    if @revealed
      if @bombed
        "X"
      elsif @bombed_neighbors == 0
        "-"
      else
        @bombed_neighbors.to_s
      end
    else
      if @flagged
        "F"
      else
        "*"
      end
    end
  end

  def revealed?
    @revealed
  end

  def reveal
    unless @revealed
      @revealed = true
      reveal_neighbors if @bombed_neighbors == 0
    end
  end

  def reveal_neighbors
    neighbor_pos.each do |pos|
      @board[pos].reveal
    end
  end

  def neighbor_pos
    neighbor_pos = []
    -1.upto(1) do |row_change|
      -1.upto(1) do |col_change|
        row = @pos.first + row_change
        col = @pos.last + col_change
        if (0...@board.size).cover?(row) &&
           (0...@board.size).cover?(col)
          neighbor_pos << [row, col]
        end
      end
    end

    neighbor_pos
  end

end
