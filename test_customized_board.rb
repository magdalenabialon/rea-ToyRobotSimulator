require 'minitest/autorun'
# require_relative 'robot_commands'
require_relative 'execute_user_commands'


# for testing purposes needed to change methods from private to public
class ExecuteUserCommands
  public :place

  # not really sure if I can stub just the method for testing like that ?? 
  def place  
    @toy.place(9,10,'EAST')
  end

end



class TestExecuteCommandsWhenCustomizedBoard < Minitest::Test

  class DummyUserInput
    def initialize(user_input)
      @user_input = user_input.upcase
    end
    def save_command
      @user_input
    end
  end


  def test_PLACE_command_when_customized_board
    board = Board.new(9,10)
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('PLACE')
    assert_equal 'EAST' , ExecuteUserCommands.new(robot, dummy_user_input).place
  end

  def test_PLACE_command_when_customized_board_not_valid_position
    board = Board.new(6,7)
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('PLACE')
    assert_equal "X and Y must be in 0 to 6 (for X) and 7 (for Y) range and face must be north south east or west" , ExecuteUserCommands.new(robot,dummy_user_input).place
  end

end