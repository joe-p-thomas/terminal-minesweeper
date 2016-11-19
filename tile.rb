class Tile
  attr_reader :pos

  def initialize(pos)
    @pos = pos
    @bomb = false
    @flagged = false
    @revealed = false
    @bomb_neighbors = 0
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

  


end
