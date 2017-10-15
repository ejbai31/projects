

class Board

  attr_reader :grid

  def self.empty_grid
    Array.new(9) do Array.new(9){Tile.new(0)} #0?
  end

  def self.from_file(file)

  end

  def initialize(grid = Board.#?)
    @grid = grid
  end

  def render
  end

  def solved?
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    tile = @grid[row][col]
    tile.val = val 
  end


end
