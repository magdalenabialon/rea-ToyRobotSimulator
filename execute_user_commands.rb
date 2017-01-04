
class ExecuteUserCommands

  def initialize(user_input)
    @user_input = user_input
  end

  def get_user_input
    @user_input.save_command
  end

end


class UserInput
  def save_command
    gets.chomp.upcase
  end
end


# user_input = UserInput.new
# command = ExecuteUserCommands.new(user_input)
# p command.get_user_input