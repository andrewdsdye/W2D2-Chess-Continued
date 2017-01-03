require "colorize"
require_relative "cursor"

class Display

  attr_reader :board, :notifications, :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end


  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end


  def colors_for(i, j)
    if [i, j] == cursor.cursor_pos
      bg = :yellow
    elsif (i + j).odd?
      bg = :light_blue
    else
      bg = :white
    end
    { background: bg }
  end

  def render
    system("clear")
    puts "Use arrow keys to move, and space or enter to confirm."
    build_grid.each { |row| puts row.join }
  end

end

# p Display.new(Array.new(8) { Array.new(8, nil) })
