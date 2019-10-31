require 'pry'

class Turtle
  DIRECTIONS = %w[NORTH EAST SOUTH WEST]

  attr_reader :x_position, :y_position, :direction

  def initialize(x_position, y_position, direction)
    @x_position = x_position.clamp(0,4)
    @y_position = y_position.clamp(0,4)
    @direction = direction
  end

  def move
    case @direction
    when 'NORTH'
      if (@y_position + 1) > 4
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
      if (@x_position + 1) > 4
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
    puts "#{@x_position}, #{@y_position}, #{@direction}"
  end

  def turn_left
    @direction = DIRECTIONS.rotate(-1)[DIRECTIONS.index(@direction)]
  end

  def turn_right
    @direction = DIRECTIONS.rotate[DIRECTIONS.index(@direction)]
  end
end
