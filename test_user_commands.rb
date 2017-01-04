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

  def test_execute_user_commands_simple_test_for_random_input
    robot = Robot.new
    user_input = DummyUserInput.new('something')
    assert_equal 'SOMETHING' , ExecuteUserCommands.new(robot,user_input).get_user_input
  end

  def test_PERFORM_COMMANDS_method
    robot = Robot.new
    user_input = DummyUserInput.new('PLACE')
    assert_equal 'Please start with place command' , ExecuteUserCommands.new(robot,user_input).perform_commands
  end

end