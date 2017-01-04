require_relative 'robot_commands'



class ExecuteUserCommands

  def initialize(toy,user_input)
    @toy = toy
    @user_input = user_input
  end

  def perform_commands
    greet
    @command = get_user_input

    loop do
      break if @command =~ /exit/i
    end

    # =>>>> need to figure out loop do that will take user input and save it :) 
    # =>>>> also need to test with DIFFERENT SIZE OF THE BOARD
  end

  # private

  def greet
    p 'Welcome to Toy Robot Simulator'
    p 'To exit simply type exit :)'
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

  def move
    @toy.move
  end

  def left
    @toy.left
  end

  def right
    @toy.right
  end

end



class UserInput
  def save_command
    @command = gets.chomp.upcase   #shouldn't be deleting the space here as place arguments are provided with space - need to extract each of them
  end
end







# SOME TEST DATA/COMMANDS 
# need to comment out  * private * to test them out 
# to run in bash: ruby execute_user_commands.rb


# robot = Robot.new
# user_input = UserInput.new
# command = ExecuteUserCommands.new(robot,user_input)


# # command.greet
# # p command.get_user_input

# command.place
# command.move
# command.report
# command.left
# command.report
# command.move
# command.right
# command.report



# command.perform_commands