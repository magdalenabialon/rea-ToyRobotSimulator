require 'minitest/autorun'

class TestCommands < Minitest::Test

  def test_PLACE_command_returns_simple_output
    robot = Robot.new
    assert_equal robot.place(1,1,'EAST') [1,1,'EAST']
  end
  
end