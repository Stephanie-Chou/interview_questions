# The board is represented as an array of arrays of cells, with 10 rows and 10 columns.
# Each cell can be 0 meaning empty, or 1 meaning it is filled.
class Board
  attr_accessor :cells, :board_size

  def initialize
    @board_size = { :x => 10, :y => 10 }
    blank_row = [0] * board_size[:x]
    @cells = board_size[:y].times.map { blank_row.dup }
  end

  # Add a piece to the board.
  def place_piece(piece)
    piece.piece_cells.each_with_index do |row, j|
      row.each_with_index do |cell, i|
        @cells[piece.y + j][piece.x + i] = 1 if cell == 1
      end
    end
  end

  # Remove piece from the board.
  def remove_piece(piece)
    piece.piece_cells.each_with_index do |row, j|
      row.each_with_index do |cell, i|
        @cells[piece.y + j][piece.x + i] = 0 if cell == 1
      end
    end
  end

  # Returns true if a piece will collide with the sides of the board or an existing piece. Returns false if
  # the piece is currently in a valid location.
  def collide?(piece)
    return true if boarder_collide?(piece)
    return true if piece_collide?(piece)
  end

  def boarder_collide?(piece)
     boarder_collision = piece.x<0 || piece.x + piece.piece_cells.first.length-1 > 9 || piece.y+piece.piece_cells.length >10
  end

  def piece_collide?(piece)
    # if the piece is trying to move into another
    # for each of the piece cells, check if the board cell is occupied
    piece.piece_cells.each_with_index do |row, j|
      row.each_with_index do |cell, i|
        if (@cells[piece.y + j][piece.x + i] == 1 && cell == 1)
          return true
        end
      end
    end
    false
  end

  # Removes filled rows from the board. Returns the number of lines cleared.
  def clear_lines()
    count = 0
    @cells.each_with_index do |row, j|
      if !row.include?(0)
        @cells.delete_at(j)
        @cells.unshift([0] * board_size[:x])
        count += 1
      end
    end
    return count
  end

  # Prints the board to stdout.
  def draw
    puts "*" * (@cells.first.size + 2)
    @cells.each do |row|
      puts "|" + row.map { |column_value| column_value == 0 ? " " : "#" }.join + "|"
    end
    puts "*" * (@cells.first.size + 2)
  end
end