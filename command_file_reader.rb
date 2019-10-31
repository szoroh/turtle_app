require 'pry'
require_relative('turtle')

class CommandFileReader
  def self.process_file
    file = ARGV.first
    if File.file?(file)
      File.foreach(file) do |command|
        commnad, *params = command.chomp.split(/\s/)

        CommandFileReader.interpret(commnad, *params)
      end
    else
      puts 'File not found.'
    end
  end

  private

  def self.interpret(command, *params)
    case command
    when /\APLACE\z/i
      CommandFileReader.create_turtle(params)
    when /\AREPORT\z/i
      CommandFileReader.report
    when /\ARIGHT\z/i
      CommandFileReader.turn_right
    when /\ALEFT\z/i
      CommandFileReader.turn_left
    when /\AMOVE\z/i
      CommandFileReader.move
    end
  end


  def self.create_turtle(params)
    @turtle = Turtle.new(params.first.split(',')[0].to_i, params.first.split(',')[1].to_i, params.first.split(',')[2])
  end

  def self.report
    @turtle.report
  end

  def self.turn_right
    @turtle.turn_right
  end

  def self.turn_left
    @turtle.turn_left
  end

  def self.move
    @turtle.move
  end
end

CommandFileReader.process_file
