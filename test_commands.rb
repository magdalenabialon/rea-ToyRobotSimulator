require 'minitest/autorun'
require_relative 'commands'


class TestCommands < Minitest::Test

  def test_PLACE_command_returns_simple_output
    robot = Robot.new
    assert_equal [1,1,'EAST'] , robot.place(1,1,'EAST')
  end
  
end