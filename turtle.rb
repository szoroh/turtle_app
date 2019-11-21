require 'pry'

class Turtle
  DIRECTIONS = %w[NORTH EAST SOUTH WEST]
  MIN_SIZE = 0
  MAX_SIZE = 4

  attr_reader :x_position, :y_position, :direction

  def initialize(x_position, y_position, direction)
    @x_position = x_position.clamp(MIN_SIZE, MAX_SIZE)
    @y_position = y_position.clamp(MIN_SIZE, MAX_SIZE)
    @direction = direction
  end

  def move
    new_x = @x_position
    new_y = @y_position

    case @direction
    when 'NORTH'
        new_y += 1
    when 'SOUTH'
        new_y -= 1
    when 'EAST'
        new_x += 1
    when 'WEST'
        new_x -= 1
    end

    if new_x >= MIN_SIZE && new_x <= MAX_SIZE && new_y >= MIN_SIZE && new_y <= MAX_SIZE
      @x_position = new_x
      @y_position = new_y
    else
      p 'You cannot perform that move.'
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
