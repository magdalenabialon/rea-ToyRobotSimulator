
class Robot

  attr_reader :board_size_X, :board_size_Y

  def initialize(board_size_X=5, board_size_Y=5)
    @board_size_X = board_size_X
    @board_size_Y = board_size_Y
  end
  
  def place(x,y,face)
    if  check_if_on_board(x,y) && check_valid_face(face)
      @x = x
      @y = y
      @face = face
      # [@x,@y,@face]
    else
      p print_fail_board_range
    end
  end

  def move
    case @face
    when 'NORTH'
      @y <= @board_size_Y - 1 ? @y += 1 : 'The toy robot must not fall off the table during movement'
    when 'SOUTH'
      @y >= 1 ? @y -= 1 : 'The toy robot must not fall off the table during movement'
    when 'WEST'
      @x >= 1 ? @x -= 1 : 'The toy robot must not fall off the table during movement'
    when 'EAST'
      @x <= @board_size_X - 1 ? @x += 1 : 'The toy robot must not fall off the table during movement'
    end

  end


  def check_if_on_board(x,y)
    (0..@board_size_X) === x && (0..@board_size_Y) === y
  end

  def check_valid_face(face)
    ['NORTH','SOUTH','EAST','WEST'].include?(face)
  end

  def print_fail_board_range
    "X and Y must be in 0 to #{@board_size_X} (for X) and #{@board_size_Y} (for Y) range and face must be north south east or west"
  end

end






# robot = Robot.new
# p robot.place(0,0,'NORTH')
# robot.place(10,0,'NORTH')
# robot.place(1,1,'sth')
# robot.place(1,1,'EAST')
# robot.place(0,0,'SOUTH')
# robot.place(5,5,'EAST')
# p robot.move

