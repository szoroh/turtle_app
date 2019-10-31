require 'spec_helper'

RSpec.describe Turtle do
  describe 'turtle movement' do
    context 'after single move' do
      it 'has different y coordinate' do
        turtle = Turtle.new(1,1,'NORTH')

        turtle.move
        expect(turtle.y_position).to eq(2)
      end
    end

    context 'after forward movement on board edge' do
      it 'cannot cross its end vertically oriented' do
        turtle = Turtle.new(3,4, 'NORTH')

        turtle.move
        expect(turtle.y_position).to eq(4)
      end

      it 'cannot cross its end horizontally oriented' do
        turtle = Turtle.new(0,3,'WEST')

        turtle.move
        expect(turtle.x_position).to eq(0)
      end
    end

    context 'while performing a turn' do
      it 'should turn to the right side' do
        turtle = Turtle.new(2, 2, 'EAST')

        turtle.turn_right
        expect(turtle.direction).to eq('SOUTH')
      end

      it 'should turn to the left side' do
        turtle = Turtle.new(2, 2, 'EAST')

        turtle.turn_left
        expect(turtle.direction).to eq('NORTH')
      end
    end
  end

  describe 'turtle initial position' do
    context 'with too low x coordinate' do
      it 'should set it to the lowest digit on the board' do
        turtle = Turtle.new(-1, 2, 'WEST')

        expect(turtle.x_position).to eq(0)
        expect(turtle.y_position).to eq(2)
      end
    end

    context 'with too high x coordinate' do
      it 'should set it to the highest digit on board' do
        turtle = Turtle.new(300, 2, 'EAST')

        expect(turtle.x_position).to eq(4)
        expect(turtle.y_position).to eq(2)
      end
    end

    context 'with too low y coordinate' do
      it 'should set it to the lowest digit on the board' do
        turtle = Turtle.new(2, -4, 'NORTH')

        expect(turtle.x_position).to eq(2)
        expect(turtle.y_position).to eq(0)
      end
    end

    context 'with too high y coordinate' do
      it 'should set it to the highest digit on the board' do
        turtle = Turtle.new(2, 300, 'EAST')

        expect(turtle.x_position).to eq(2)
        expect(turtle.y_position).to eq(4)
      end
    end
  end
end
