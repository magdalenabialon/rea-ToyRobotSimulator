require 'minitest/autorun'
require_relative 'robot_commands'
require_relative 'execute_user_commands'


class TestExecuteUserCommands < Minitest::Test

  class DummyUserInput
    def initialize(user_input)
      @user_input = user_input
    end

    def save_command
      @user_input
    end
  end

  def test_execute_user_commands_first_simple_test
    user_input = DummyUserInput.new('PLACE')
    assert_equal 'PLACE' , ExecuteUserCommands.new(user_input).get_user_input
  end
end