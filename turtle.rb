require 'pry'

class Turtle
  DIRECTIONS = %w[NORTH EAST SOUTH WEST]

  def initialize(x_position, y_position, direction)
    @x_position = x_position
    @y_position = y_position
    @direction = direction
  end

  def move
    case @direction
    when 'NORTH'
      if (@y_position + 1) > 5
        p 'You cannot perform that move.'
      else
        @y_position += 1
      end
    when 'SOUTH'
      if (@y_position - 1) < 0
        p 'You cannot perform that move.'
      else
        @y_position -= 1
      end
    when 'EAST'
      if (@x_position + 1) > 5
        p 'You cannot perform that move.'
      else
        @x_position += 1
      end
    when 'WEST'
      if (@x_position - 1) < 0
        p 'You cannot perform that move.'
      else
        @x_position -= 1
      end
    end
  end

  def report
    "#{@x_position}, #{@y_position}, #{@direction}"
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
