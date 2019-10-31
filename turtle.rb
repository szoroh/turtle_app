require 'pry'

class Turtle
  DIRECTIONS = %w[NORTH EAST SOUTH WEST]

  def initialize(x_position, y_position, direction)
    @x_position = x_position
    @y_position = y_position
    @direction = direction
  end

  private

  attr_accessor :x_position, :y_position, :direction
end

class Board
  attr_reader :height, :length

  def initialize(height = 5, length = 5)
    @height = height
    @length = length
  end
end
