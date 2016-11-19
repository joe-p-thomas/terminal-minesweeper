class Tile
  attr_reader :pos

  def initialize(pos,board)
    @pos = pos
    @board = board

    @bomb = false
    @bomb_neighbors = 0
    @flagged = false
    @revealed = false
  end

  def display
    if revealed
      if @bomb
        "X"
      elsif @bomb_neighbors = 0
        " "
      else
        @bomb_neighbors.to_s
      end
    else
      if @flagged
        "F"
      else
        "*"
      end
    end
  end

  def reveal
    if @bomb_neighbors = 0 && !@revealed
      @revealed = true
      reveal_neighbors
    else
      @revealed = true
    end
  end

  def neighbor_pos
    neighbor_pos = []

    -1.upto(1) do |row_change|
      -1.upto(1) do |col_change|
        row = pos.first + row_change
        col = pos.last + col_change
        if (0..8).inlcude?(row) && (0..8).include?(col)
          neighbor_pos << [row, col]
        end
      end
    end

    neighbor_pos
  end

  def change_flag
    if @flagged
      @flagged = false
    else
      @flagged = true
    end
  end

end
