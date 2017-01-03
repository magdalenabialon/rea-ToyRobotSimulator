require 'minitest/autorun'
require_relative 'commands'


class TestCommands < Minitest::Test

  @@robot = Robot.new

  def test_PLACE_command_returns_simple_output
    assert_equal [1,1,'EAST'] , @@robot.place(1,1,'EAST')
  end

  def test_PLACE_command_not_valid_X_Y
    assert_equal "X and Y must be in 0 to 5 (for X) and 5 (for Y) range and face must be north south east or west" , @@robot.place(10,-1,'NORTH')
  end

  def test_PLACE_command_not_valid_FACE
    assert_equal "X and Y must be in 0 to 5 (for X) and 5 (for Y) range and face must be north south east or west" , @@robot.place(0,1,'NAH')
  end

  def test_MOVE_command
    @@robot.place(1,1,'EAST')
    assert_equal 2 , @@robot.move
  end
  
end