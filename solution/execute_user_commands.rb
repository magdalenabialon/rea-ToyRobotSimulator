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
      break if @command =~ /^\s*EXIT\s*$/
      case @command
        when /\s*PLACE\s*[0-9]\s*[0-9]\s*NORTH| SOUTH| WEST| EAST/
          place
        when /^\s*REPORT\s*$/
          report
        when /^\s*MOVE\s*$/
          move
        when /^\s*LEFT\s*$/
          left
        when /^\s*RIGHT\s*$/
          right
        else 
          p 'I am afraid it is not a valid command.. -_-'
      end
    ask_and_save_user_input
    ## break  # breaks app -> ONLY FOR TESTING! PERFORM_COMMANDS_method -> without it endless loop in tests -_-
    end

  end

  private

  def greet
    p 'Welcome to Toy Robot Simulator'
    p 'valid commands:  place x y face ||  move  ||  left  ||  right  ||  report'
    p 'To exit simply type exit :)'
    p 'Please start with the place command and x y face arguments'
  end

  def get_user_input
    @user_input.save_command
  end

  def ask_for_user_input
    p 'Please type the command: place x y face  ||  move  ||  left  ||  right  ||  report'
  end

  def ask_and_save_user_input
    ask_for_user_input
    @command = get_user_input
  end
  
  def place
    arguments = @command.gsub('PLACE', '').split(' ')
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
    @command = gets.chomp.upcase   #shouldn't be deleting the spaces here as place arguments are provided with space - need to extract each of them
  end
end








# SOME TEST DATA/COMMANDS 
# to run in bash: ruby execute_user_commands.rb

board = Board.new
robot = Robot.new(board)
user_input = UserInput.new
command = ExecuteUserCommands.new(robot,user_input)
command.perform_commands


# THOSE ARE PRIVATE - > need to comment  * private *  in ExecuteUserCommands class to test them out from this file :)
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
