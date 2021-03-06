require 'minitest/autorun'
# require_relative '../solution/robot_movements.rb'
require_relative '../solution/execute_user_commands.rb'



# for testing purposes needed to change methods from private to public
class ExecuteUserCommands

  public :get_user_input, :greet, :place, :report, :move, :left, :right

  # Not really sure if can overwrite method (stub?) for testing like that ? 
  def place
    @toy.place(2,2,'SOUTH')
  end

end



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
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('PLACE')
    assert_equal 'PLACE' , ExecuteUserCommands.new(robot,dummy_user_input).get_user_input
  end

  def test_GetUserInput_method_random_input
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('something')
    assert_equal 'SOMETHING' , ExecuteUserCommands.new(robot,dummy_user_input).get_user_input
  end

  def test_GREET_method
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('PLACE')
    assert_equal 'Please start with the place command and x y face arguments' , ExecuteUserCommands.new(robot,dummy_user_input).greet
  end

  def test_PLACE_method                              
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('PLACE')
    assert_equal 'SOUTH' , ExecuteUserCommands.new(robot,dummy_user_input).place
  end

  def test_REPORT_method_when_PLACEd
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('PLACE')
    ExecuteUserCommands.new(robot,dummy_user_input).place   
    assert_equal '2,2,SOUTH' , ExecuteUserCommands.new(robot,dummy_user_input).report
  end

  def test_REPORT_method_when_NOT_PLACEd
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('PLACE')
    assert_equal 'First you need to place the Robot on the board! :)' , ExecuteUserCommands.new(robot,dummy_user_input).report
  end

  def test_MOVE_method_when_PLACEd
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('something')
    ExecuteUserCommands.new(robot,dummy_user_input).place   
    assert_equal 1 , ExecuteUserCommands.new(robot,dummy_user_input).move
  end

  def test_MOVE_method_when_NOT_PLACEd
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('sth')
    assert_equal 'First you need to place the Robot on the board! :)' , ExecuteUserCommands.new(robot,dummy_user_input).move
  end

  def test_LEFT_method_when_PLACEd
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('sth')
    ExecuteUserCommands.new(robot,dummy_user_input).place   
    assert_equal 'EAST' , ExecuteUserCommands.new(robot,dummy_user_input).left
  end

  def test_RIGHT_method_when_PLACEd
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('sth')
    ExecuteUserCommands.new(robot,dummy_user_input).place   
    assert_equal 'WEST' , ExecuteUserCommands.new(robot,dummy_user_input).right
  end

  def test_when_multiple_methods_were_called
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('sth')
    ExecuteUserCommands.new(robot,dummy_user_input).place   
    ExecuteUserCommands.new(robot,dummy_user_input).right   
    ExecuteUserCommands.new(robot,dummy_user_input).move    
    assert_equal '1,2,WEST' , ExecuteUserCommands.new(robot,dummy_user_input).report
  end

  def test_PERFORM_COMMANDS_method_to_EXIT_simulator
    board = Board.new
    robot = Robot.new(board)
    dummy_user_input = DummyUserInput.new('exit')
    assert_equal nil , ExecuteUserCommands.new(robot,dummy_user_input).perform_commands
  end

  # def test_PERFORM_COMMANDS_method     # ->    *** not really sure how to test it -_- ***   -> when * break * uncommented in * loop *  that gives nil
    # board = Board.new
    # robot = Robot.new(board)
  #   dummy_user_input = DummyUserInput.new('PLACE')
  #   assert_equal nil , ExecuteUserCommands.new(robot,dummy_user_input).perform_commands
  # end

end

