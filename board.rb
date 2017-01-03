require_relative "pieces"
require "byebug"

class Board

  attr_reader :rows

  def initialize
    @null = NullPiece.instance
    make_starting_grid
  end

  def add_pawns(color)
    i = (color == :white) ? 6 : 1
    8.times { |j| Pawn.new(color, self, [i, j]) }
  end

  def add_pieces(color)
    pieces = [ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ]
    i = (color == :white) ? 7 : 0
    pieces.each_with_index do |piece_class, j|
      piece_class.new(color, self, [i, j])

    end
  end

  def make_starting_grid
    @rows = Array.new(8) { Array.new(8, @null) }
    [:white, :black].each do |color|
      add_pieces(color)
      add_pawns(color)
    end
  end

  def []pos
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @rows[row][col] = piece
  end


  def add_piece(piece, pos)
    if empty?(pos)
      self[pos] = piece
    else
      puts "Space is occupied"
    end
  end

  def empty?(pos)
    self[pos].empty?
  end

  def valid_pos?(pos)
    pos.all? { |coodinate| coord.between?(0,7) }
  end

  # def populate_pieces
  #   @rows.each_index do |i|
  #     @rows[i].each_index do |j|
  #       if i == 0
  #         self[[i,j]] = 1 # 1 = piece
  #       elsif i == 7
  #         self[[i,j]] = 1
  #       elsif i == 1
  #         self[[i,j]] = Piece.new # 0 = pawn
  #       elsif i == 6
  #         self[[i,j]] = 0
  #       end
  #     end
  #   end
  # end


  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise "No piece there." if piece == nil
    self[end_pos] = piece
    self[start_pos] = nil
  end

end
