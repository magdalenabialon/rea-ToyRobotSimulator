# require_relative 'board'
# require_relative 'robot_commands'
require_relative 'execute_user_commands'


# TO CHANGE BOARD SIZE SIMPLY PROVIDE X and Y for Board object like in the example:
# board = Board.new(9,10)

board = Board.new
robot = Robot.new(board)
user_input = UserInput.new
command = ExecuteUserCommands.new(robot,user_input)
command.perform_commands