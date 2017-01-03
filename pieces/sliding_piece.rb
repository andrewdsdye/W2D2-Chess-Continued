module SlidingPiece
  HORIZONTAL_DIRS = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []

    move_dirs.each do |x, y|
      moves.concat(continue_unblocked(x, y))
    end

    moves
  end

  def continue_unblocked(x, y)
    current_x, current_y = pos
    moves = []
    until board.valid?(pos) == false
      current_x, current_y = current_x + x, current_y + y
      pos = [current_x, current_y]

      if board.empty?(pos)
        moves << pos
      else
        moves << pos if board[pos].color != self.color
        break
      end
    end
    moves
  end

end
