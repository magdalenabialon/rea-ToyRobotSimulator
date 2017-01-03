require 'minitest/autorun'
require_relative 'commands'


class TestCommands < Minitest::Test

  def test_PLACE_command_returns_simple_output
    robot = Robot.new
    assert_equal [1,1,'EAST'] , robot.place(1,1,'EAST')
  end

  def test_PLACE_command_not_valid_X_Y
    robot = Robot.new
    assert_equal "X and Y must be in 0 to 5 (for X) and 5 (for Y) range and face must be north south east or west", robot.place(10,-1,'NORTH')
  end
  
end