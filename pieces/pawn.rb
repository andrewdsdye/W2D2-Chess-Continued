require_relative "piece"

class Pawn < Piece

  def symbol
    "P".colorize(color)
  end

  def moves
    forward + diagonal_attack
  end

  def forward
    i, j = pos
    one_step = [i + forward_dir, j]
    return [] unless board.valid_pos?(one_step) && board.empty?(one_step)

    steps = [one_step]
    two_step = i + 2 * forward_dir, j]
    steps << two_step if at_start? && board.empty?(two_step)
    steps
  end

  def forward_dir
    (color == :white) ? -1 : 1
  end

  def at_start?
    pos[0] == ((color == :white) ? 6 : 1)
  end

  def diagonal_attack
    i, j = pos

    diagonal_moves = [[i + forward_dir, j - 1], [i + forward_dir, j + 1]]
    diagonal_moves.select do |new_pos|
      next false unless board.valid_pos?(new_pos)
      next false if board.empty?(new_pos)

      threatened_piece = board[new_pos]
      threatened_piece && threatened_piece.color != self.color
    end
  end

end
