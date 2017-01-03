
class Robot

  attr_reader :board_size_X, :board_size_Y

  def initialize(board_size_X=5, board_size_Y=5)
    @board_size_X = board_size_X
    @board_size_Y = board_size_Y
  end
  
  def place(x,y,face)
    if (0..5) === x && (0..5) === y && ['NORTH','SOUTH','EAST','WEST'].include?(face)
      @x = x
      @y = y
      @face = face
      [@x,@y,@face]
    else
      "X and Y must be in 0 to #{@board_size_X} (for X) and #{@board_size_Y} (for Y) range and face must be north south east or west"
    end
  end

end







# robot = Robot.new
# p robot.place(0,0,'NORTH')
# p robot.place(10,0,'NORTH')
# p robot.place(1,0,'sth')