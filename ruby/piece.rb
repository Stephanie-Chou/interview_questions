module Shapes
  SQUARE = [[1, 1], [1, 1]]

  T = [[1, 1, 1],
       [0, 1, 0]]

  S = [[1, 1, 0],
       [0, 1, 1]]

  I = [[1,1,1,1]]

  L = [[1,1],
      [0,1],
      [0,1]]
  J = Shapes::L.reverse

  Z = Shapes::S.reverse
end

# Encapsulation of a tetris piece.
class Piece
  attr_accessor :x, :y, :piece_cells

  def initialize(x, y, piece_cells)
    @x = x
    @y = y
    @piece_cells = piece_cells
  end

  # Rotate this piece.
  def rotate(direction = :counterclockwise)
    if direction == :counterclockwise
      @piece_cells = @piece_cells.transpose.reverse
    else
      @piece_cells = @piece_cells.reverse.transpose
    end
  end

  # Move this piece by x and y.
  def move(x, y)
    @x += x
    @y += y
  end
end