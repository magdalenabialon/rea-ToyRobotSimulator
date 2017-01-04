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
  
  def place
    p 'Please enter arguments x y face'
    arguments = gets.chomp.upcase.split(' ')
    x = arguments[0].to_i
    y = arguments[1].to_i
    face = arguments[2]
    @toy.place(x,y,face)
  end

  def report
    @toy.report
  end

end


class UserInput
  def save_command
    @command = gets.chomp.upcase   #shouldn't be deleting the space here as place arguments are provided with space - need to extract each of them
  end
end


# robot = Robot.new
# user_input = UserInput.new
# command = ExecuteUserCommands.new(robot,user_input)
# command.perform_commands