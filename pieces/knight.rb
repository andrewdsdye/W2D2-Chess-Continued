require_relative "piece"
# require_relative "stepping_piece"

class Knight < Piece
  # include SteppingPiece

  def symbol
    "K".colorize(color)
  end

  def move_changes
    [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  end

end
