require 'minitest/autorun'
require_relative 'commands'


class TestCommands < Minitest::Test

  @@robot = Robot.new

  def test_PLACE_command_returns_simple_output
    assert_equal 'EAST' , @@robot.place(1,1,'EAST')
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

  def test_MOVE_command_different_placement
    @@robot.place(3,3,'EAST')
    assert_equal 4 , @@robot.move
  end

  def test_MOVE_command_when_could_fall_from_board_0x0
    @@robot.place(0,0,'SOUTH')
    assert_equal 'The toy robot must not fall off the table during movement' , @@robot.move
  end

  def test_MOVE_command_when_could_fall_from_board_5x5
    @@robot.place(5,5,'EAST')
    assert_equal 'The toy robot must not fall off the table during movement' , @@robot.move
  end

  def test_MOVE_command_when_face_lowercase_or_with_space
    @@robot.place(1,1,' east  ')
    assert_equal 2 , @@robot.move
  end

  def test_MOVE_command_when_notPLACEd
    assert_equal 'First you need to place the Robot on the board! :)', @@robot.move
  end
  
end