require 'minitest/autorun'
require_relative 'robot_commands'


class TestExecuteUserCommands < Minitest::Test

  def test_execute_user_commands_first_simple_test
    assert_equal 'PLACE' , ExecuteUserCommands.get_user_input
  end
end