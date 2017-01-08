# require_relative 'board'
# require_relative 'robot_commands'
require_relative 'solution/execute_user_commands.rb'


# TO CHANGE BOARD SIZE SIMPLY PROVIDE arguments X and Y for Board object like in the example:
# board = Board.new(9,10)

board = Board.new
robot = Robot.new(board)
user_input = UserInput.new
command = ExecuteUserCommands.new(robot,user_input)
command.perform_commands
