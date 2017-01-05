require_relative 'board'



class Robot

  def initialize(board)
    @board = board
  end
  
  def place(x,y,face)
    if check_if_on_board(x,y) && check_valid_face(face)
      @x = x
      @y = y
      @face = upcase_face_and_remove_spaces(face)          
    else
      p print_fail_board_range
    end
  end

  def move
    return print_fail_message_when_not_placed unless @face
    case @face
    when 'NORTH'
      @y <= @board.size_Y - 1 ? @y += 1 : print_fail_message_if_could_fall_out
    when 'SOUTH'
      @y >= 1 ? @y -= 1 : print_fail_message_if_could_fall_out
    when 'WEST'
      @x >= 1 ? @x -= 1 : print_fail_message_if_could_fall_out
    when 'EAST'
      @x <= @board.size_X - 1 ? @x += 1 : print_fail_message_if_could_fall_out
    end
  end

  def left
    return print_fail_message_when_not_placed unless @face
    case @face
    when 'NORTH'
      @face = 'WEST'
    when 'SOUTH'
      @face = 'EAST'
    when 'WEST'
      @face = 'SOUTH'
    when 'EAST'
      @face = 'NORTH'
    end
  end

  def right
    return print_fail_message_when_not_placed unless @face
    case @face
    when 'NORTH'
      @face = 'EAST'
    when 'SOUTH'
      @face = 'WEST'
    when 'WEST'
      @face = 'NORTH'
    when 'EAST'
      @face = 'SOUTH'
    end
  end

  def report
    return print_fail_message_when_not_placed unless @face
    p [@x,@y,@face]
  end

  private

  def check_if_on_board(x,y)
    (0..@board.size_X) === x && (0..@board.size_Y) === y
  end

  def upcase_face_and_remove_spaces(face)
    face.gsub(/\s+/ , '').upcase
  end

  def check_valid_face(face)
    face != nil ? valid_face = upcase_face_and_remove_spaces(face) : print_fail_board_range
    valid_face.eql?('NORTH') || valid_face.eql?('SOUTH') || valid_face.eql?('EAST') || valid_face.eql?('WEST')    
  end

  def print_fail_board_range
    "X and Y must be in 0 to #{@board.size_X} (for X) and #{@board.size_Y} (for Y) range and face must be north south east or west"
  end

  def print_fail_message_if_could_fall_out
    p 'The toy robot must not fall off the table during movement'
  end

  def print_fail_message_when_not_placed
    p 'First you need to place the Robot on the board! :)'
  end

end





# SOME TEST DATA/COMMANDS 
# to run in bash: ruby robot_commands.rb

# board = Board.new
# robot = Robot.new(board)
# p robot.place(0,0,'NORTH')
# robot.place(10,0,'NORTH')
# robot.place(1,1,'sth')
# robot.place(1,1,'EAST')
# robot.place(0,0,'SOUTH')
# robot.place(5,5,'EAST')
# robot.place(4,4,' east ')
# p robot.move
# p robot.right
# p robot.left
# p robot.report
# p robot.print_fail_message_when_not_placed


# board1 = Board.new(10,10)
# robot1 = Robot.new(board1)
# robot1.place(10,8,'NORTH')
# robot1.report


# board2 = Board.new(7,9)
# robot2 = Robot.new(board2)
# robot2.place(10,8,'NORTH')
# robot2.report


