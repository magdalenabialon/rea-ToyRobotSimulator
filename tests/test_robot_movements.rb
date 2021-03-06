require 'minitest/autorun'
# require_relative '../solution/board.rb'
require_relative '../solution/robot_movements.rb'



class TestRobotMovements < Minitest::Test

  board = Board.new
  @@robot = Robot.new(board)


  def test_PLACE_method_returns_simple_output
    assert_equal 'EAST' , @@robot.place(1,1,'EAST')
  end

  def test_PLACE_method_not_valid_X_Y
    assert_equal "X and Y must be in 0 to 5 (for X) and 5 (for Y) range and face must be north south east or west" , @@robot.place(10,-1,'NORTH')
  end

  def test_PLACE_method_not_valid_FACE
    assert_equal "X and Y must be in 0 to 5 (for X) and 5 (for Y) range and face must be north south east or west" , @@robot.place(0,1,'NAH')
  end

  def test_MOVE_method
    @@robot.place(1,1,'EAST')
    assert_equal 2 , @@robot.move
  end

  def test_MOVE_method_different_placement
    @@robot.place(3,3,'EAST')
    assert_equal 4 , @@robot.move
  end

  def test_MOVE_method_when_could_fall_from_board_0x0
    @@robot.place(0,0,'SOUTH')
    assert_equal 'The toy robot must not fall off the table during movement' , @@robot.move
  end

  def test_MOVE_method_when_could_fall_from_board_5x5
    @@robot.place(5,5,'EAST')
    assert_equal 'The toy robot must not fall off the table during movement' , @@robot.move
  end

  def test_MOVE_method_when_face_lowercase_or_with_spaces
    @@robot.place(1,1,' east ')
    assert_equal 2 , @@robot.move
  end

  def test_REPORT_method
    @@robot.place(3,3,'SOUTH')
    assert_equal '3,3,SOUTH' , @@robot.report
  end

  def test_REPORT_method_when_movement_not_possible
    @@robot.place(0,0,'SOUTH')
    @@robot.move
    assert_equal '0,0,SOUTH' , @@robot.report 
  end

  def test_LEFT_method
    @@robot.place(1,1,'WEST')
    assert_equal 'SOUTH' , @@robot.left
  end

  def test_RIGHT_method
    @@robot.place(1,1,'WEST')
    assert_equal 'NORTH' , @@robot.right
  end

  def test_when_multiple_methods_were_called_and_face_lower_upercase_with_spaces
    @@robot.place(2,3,'EasT ')
    @@robot.move
    @@robot.left
    @@robot.move
    assert_equal '3,4,NORTH' , @@robot.report
  end

  def test_PLACE_method_when_face_lowercase_or_with_space_or_any_other_caracter
    assert_equal "X and Y must be in 0 to 5 (for X) and 5 (for Y) range and face must be north south east or west" , @@robot.place(1,1,'b east1 9N $')
  end

end



class TestRobotMovementsWhenNotPlaced < Minitest::Test
  
  board = Board.new
  @@robot = Robot.new(board)

  def test_MOVE_method_when_notPLACEd
    assert_equal 'First you need to place the Robot on the board! :)' , @@robot.move
  end

  def test_REPORT_method_when_not_PLACEd
    assert_equal 'First you need to place the Robot on the board! :)' , @@robot.report
  end

  def test_LEFT_method_when_not_PLACEd
    assert_equal 'First you need to place the Robot on the board! :)' , @@robot.left
  end

end



class TestRobotMovementsWhenCustomizedBoard < Minitest::Test

  board = Board.new(9,9)
  @@robot = Robot.new(board)

  def test_MOVE_method_when_customized_board
    assert_equal 'NORTH' , @@robot.place(8,7,'NORTH')
  end

  def test_PLACE_method_when_not_valid_X_Y
    assert_equal "X and Y must be in 0 to 9 (for X) and 9 (for Y) range and face must be north south east or west" , @@robot.place(10,-1,'NORTH')
  end

end