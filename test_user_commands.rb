require 'minitest/autorun'
require_relative 'robot_commands'
require_relative 'execute_user_commands'


class TestExecuteUserCommands < Minitest::Test

  class DummyUserInput
    def initialize(user_input)
      @user_input = user_input.upcase
    end

    def save_command
      @user_input
    end
  end


  def test_execute_user_commands_first_simple_test
    robot = Robot.new
    user_input = DummyUserInput.new('PLACE')
    assert_equal 'PLACE' , ExecuteUserCommands.new(robot,user_input).get_user_input
  end

  def test_GetUserInput_method_random_input
    robot = Robot.new
    user_input = DummyUserInput.new('something')
    assert_equal 'SOMETHING' , ExecuteUserCommands.new(robot,user_input).get_user_input
  end

  # def test_PERFORM_COMMANDS_method
  #   robot = Robot.new
  #   user_input = DummyUserInput.new('PLACE')
  #   assert_equal ?? , ExecuteUserCommands.new(robot,user_input).perform_commands
  # end

  def test_GREET_method
    robot = Robot.new
    user_input = DummyUserInput.new('PLACE')
    assert_equal 'Please start with place command' , ExecuteUserCommands.new(robot,user_input).greet
  end

  def test_PLACE_method    #TODO ADD TEST PLACE METHOD FOR CUSTOMIZED BOARD
    robot = Robot.new
    user_input = DummyUserInput.new('PLACE')
    assert_equal 'SOUTH' , ExecuteUserCommands.new(robot,user_input).place
  end

  def test_REPORT_method_when_PLACEd
    robot = Robot.new
    user_input = DummyUserInput.new('PLACE')
    ExecuteUserCommands.new(robot,user_input).place
    assert_equal [2,2,'SOUTH'] , ExecuteUserCommands.new(robot,user_input).report
  end

  def test_REPORT_method_when_NOT_PLACEd
    robot = Robot.new
    user_input = DummyUserInput.new('PLACE')
    assert_equal 'First you need to place the Robot on the board! :)' , ExecuteUserCommands.new(robot,user_input).report
  end

  def test_MOVE_method_when_PLACEd
    robot = Robot.new
    user_input = DummyUserInput.new('something')
    ExecuteUserCommands.new(robot,user_input).place
    assert_equal 1 , ExecuteUserCommands.new(robot,user_input).move
  end

  def test_MOVE_method_when_NOT_PLACEd
    robot = Robot.new
    user_input = DummyUserInput.new('sth')
    assert_equal 'First you need to place the Robot on the board! :)' , ExecuteUserCommands.new(robot,user_input).move
  end

  def test_LEFT_method_when_PLACEd
    robot = Robot.new
    user_input = DummyUserInput.new('sth')
    ExecuteUserCommands.new(robot,user_input).place
    assert_equal 'EAST' , ExecuteUserCommands.new(robot,user_input).left
  end

  def test_RIGHT_method_when_PLACEd
    robot = Robot.new
    user_input = DummyUserInput.new('sth')
    ExecuteUserCommands.new(robot,user_input).place
    assert_equal 'WEST' , ExecuteUserCommands.new(robot,user_input).right
  end

end

