
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
      @face = face.gsub(/\s+/ , '').upcase
      # [@x,@y,@face]
    else
      p print_fail_board_range
    end
  end

  def move
    return 'First you need to place the Robot on the board! :)' unless @face
    case @face
    when 'NORTH'
      @y <= @board_size_Y - 1 ? @y += 1 : print_fail_message_if_could_fall_out
    when 'SOUTH'
      @y >= 1 ? @y -= 1 : print_fail_message_if_could_fall_out
    when 'WEST'
      @x >= 1 ? @x -= 1 : print_fail_message_if_could_fall_out
    when 'EAST'
      @x <= @board_size_X - 1 ? @x += 1 : print_fail_message_if_could_fall_out
    end
  end

  def report
    return 'First you need to place the Robot on the board! :)' unless @face
    p [@x,@y,@face]
  end


  def check_if_on_board(x,y)
    (0..@board_size_X) === x && (0..@board_size_Y) === y
  end

  def check_valid_face(face)
    face = face.upcase
    face =~ /\s*north\s*/i || face =~ /\s*south\s*/i || face =~ /\s*east\s*/i || face =~ /\s*west\s*/i
    # ['NORTH','SOUTH','EAST','WEST'].include?(face)
  end

  def print_fail_board_range
    "X and Y must be in 0 to #{@board_size_X} (for X) and #{@board_size_Y} (for Y) range and face must be north south east or west"
  end

  def print_fail_message_if_could_fall_out
    p 'The toy robot must not fall off the table during movement'
  end

end






# robot = Robot.new

# p robot.place(0,0,'NORTH')
# robot.place(10,0,'NORTH')
# robot.place(1,1,'sth')
# robot.place(1,1,'EAST')
# robot.place(0,0,'SOUTH')
# robot.place(5,5,'EAST')
# robot.place(4,4,' east ')

# p robot.move

