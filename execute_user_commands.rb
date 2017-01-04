require_relative 'robot_commands'



class ExecuteUserCommands

  def initialize(toy,user_input)
    @toy = toy
    @user_input = user_input
  end

  def perform_commands
    greet
    @command = gets.chomp.upcase
  end

  # private

  def greet
    p 'Welcome to Toy Robot Simulator'
    p 'Please start with place command'
  end

  def get_user_input
    @user_input.save_command
  end


end


class UserInput
  def save_command
    @command = gets.chomp.upcase
  end
end


# robot = Robot.new
# user_input = UserInput.new
# command = ExecuteUserCommands.new(robot,user_input)
# command.perform_commands