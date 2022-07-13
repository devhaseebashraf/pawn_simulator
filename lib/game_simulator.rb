require_relative 'pawn'
require_relative 'grid_table'

class GameSimulator

  def initialize
    @grid_table = GridTable.new
    @pawn = Pawn.new(@grid_table)
  end

  def call(command)
    begin
      puts @pawn.perform(command)
    rescue Exception => e
      puts e.message
    end
  end
end
