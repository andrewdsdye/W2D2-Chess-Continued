module SteppingPiece

  def moves
    move_changes.each_with_object([]) do |(x, y), moves|
      current_x, current_y = pos
      pos = [current_x + x, current_y + y]

      next unless board.valid_pos?(pos)
      if board.empty?(pos)
        moves << pos
      elsif board[pos].color != color
        moves << pos
      end
    end
  end

end
