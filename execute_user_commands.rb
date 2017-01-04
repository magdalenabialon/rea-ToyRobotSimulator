
class ExecuteUserCommands
  def get_user_input
    gets.chomp.upcase
  end
end


# command = ExecuteUserCommands.new
# p command.get_user_input