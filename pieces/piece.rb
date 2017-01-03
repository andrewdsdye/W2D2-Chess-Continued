class Piece

  attr_reader :board, :color
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    board.add_piece(self, pos)
  end

  def to_s
    "#{symbol}"
  end

  def empty?
    self.is_a?(NullPiece) ? true : false
  end

end
