class Tile
  attr_reader :pos

  def initialize(pos)
    @pos = pos
    @bomb = false
    @flagged = false
  end
  
end
