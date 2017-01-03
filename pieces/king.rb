require_relative "piece"
# require_relative "stepping_piece"

class King < Piece
  # include SteppingPiece

  def symbol
    "*".colorize(color)
  end

  def move_changes
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [1, 1], [1, -1], [1, 0], [1, 1]]
  end

end
