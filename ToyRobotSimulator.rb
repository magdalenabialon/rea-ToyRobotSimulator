require_relative 'robot_commands'
require_relative 'execute_user_commands'


# TO CHANGE BOARD SIZE SIMPLY PROVIDE X and Y for Robot object like in the example:
# robot = Robot.new(9,10)

robot = Robot.new
user_input = UserInput.new
command = ExecuteUserCommands.new(robot,user_input)
command.perform_commands