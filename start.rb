require_relative 'lib/game_simulator'

puts "# Pawn Simulator - Curve Tomorrow challenge"
puts "# Enter a valid instruction: (eg:\'PLACE X,Y,NORTH|SOUTH|EAST|WEST,WHITE|BLACK\', MOVE, LEFT, RIGHT, REPORT or EXIT)"

game_simulator = GameSimulator.new

loop do
  instruction = STDIN.gets
  instruction.strip!

  if instruction.downcase == "exit"
  	puts "See you again..."
  	exit
  end

  output = game_simulator.call(instruction)
  puts output if output
end
