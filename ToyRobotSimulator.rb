require_relative 'robot_commands'
require_relative 'execute_user_commands'


robot = Robot.new
user_input = UserInput.new
command = ExecuteUserCommands.new(robot,user_input)
command.perform_commands