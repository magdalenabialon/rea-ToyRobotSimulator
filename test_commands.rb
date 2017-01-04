require 'minitest/autorun'
require_relative 'robot_commands'


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

  def test_REPORT_command
    @@robot.place(3,3,'SOUTH')
    assert_equal [3,3,'SOUTH'] , @@robot.report
  end

  def test_REPORT_command_when_movement_not_possible
    @@robot.place(0,0,'SOUTH')
    @@robot.move
    assert_equal [0,0,'SOUTH'] , @@robot.report 
  end

  def test_LEFT_command
    @@robot.place(1,1,'WEST')
    assert_equal 'SOUTH' , @@robot.left
  end

  def test_RIGHT_command
    @@robot.place(1,1,'WEST')
    assert_equal 'NORTH' , @@robot.right
  end

  def test_when_multiple_commands_were_called
    @@robot.place(2,3,'EAST')
    @@robot.move
    @@robot.left
    @@robot.move
    assert_equal [3,4,'NORTH'] , @@robot.report
  end

end



class TestCommandsWhenRobotNotPlaced < Minitest::Test

  @@robot = Robot.new

  def test_MOVE_command_when_notPLACEd
    assert_equal 'First you need to place the Robot on the board! :)' , @@robot.move
  end

  def test_REPORT_command_when_not_PLACED
    assert_equal 'First you need to place the Robot on the board! :)' , @@robot.report
  end

  def test_LEFT_command_when_not_PLACED
    assert_equal 'First you need to place the Robot on the board! :)' , @@robot.left
  end


end



class TestCommandsWhenCustomizedBoard < Minitest::Test

  @@robot = Robot.new(9,9)

  def test_MOVE_command_when_customized_board
    assert_equal 'NORTH' , @@robot.place(8,7,'NORTH')
  end

  def test_PLACE_command_when_not_valid_X_Y
    assert_equal "X and Y must be in 0 to 9 (for X) and 9 (for Y) range and face must be north south east or west" , @@robot.place(10,-1,'NORTH')
  end

end