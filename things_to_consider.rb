class Command
  @@x = 0
  @@y = 0
  @@face = nil

  def print_fail_message_when_not_placed
    'First you need to place the Robot on the board! :)'
  end
end



class PlaceCommand < Command
  def initialize(x,y,face)
    @@x = x
    @@y = y
    @@face = face
  end
  def perform_command
    @@x
    @@y
    @@face
  end
end



class MoveCommand < Command
  def perform_command
    # return print_fail_message_when_not_placed unless @face # ??
    case @@face
      when 'NORTH'
        @@y <=  5 ? @@y += 1 : print_fail_message_if_could_fall_out
      when 'SOUTH'
        @@y >= 1 ? @@y -= 1 : print_fail_message_if_could_fall_out
      when 'WEST'
        @@x >= 1 ? @@x -= 1 : print_fail_message_if_could_fall_out
      when 'EAST'
        @@x <=  5 ? @@x += 1 : print_fail_message_if_could_fall_out
      end
  end

  def print_fail_message_if_could_fall_out
    p 'The toy robot must not fall off the table during movement'
  end
end



class LeftCommand < Command
  def perform_command
    # return print_fail_message_when_not_placed unless @face # ??
    case @@face
    when 'NORTH'
      @@face = 'WEST'
    when 'SOUTH'
      @@face = 'EAST'
    when 'WEST'
      @@face = 'SOUTH'
    when 'EAST'
      @@face = 'NORTH'
    end
  end
end



class RightCommand < Command
  def perform_command
    # return print_fail_message_when_not_placed unless @face # ??
    case @@face
    when 'NORTH'
      @@face = 'EAST'
    when 'SOUTH'
      @@face = 'WEST'
    when 'WEST'
      @@face = 'NORTH'
    when 'EAST'
      @@face = 'SOUTH'
    end
  end
end



class ReportCommand < Command
  def perform_command
  # return print_fail_message_when_not_placed unless @face # ??
    p [@@x,@@y,@@face].join(',')
  end
end



class Robot
  # def initialize(board)
  #   @board = board
  # end

  def perform_command(command_name)
    command_name.perform_command
  end
end




robot = Robot.new

place = PlaceCommand.new(2,3,"NORTH")
p robot.perform_command(place)

move = MoveCommand.new
p robot.perform_command(move)

left = LeftCommand.new
p robot.perform_command(left)

right = RightCommand.new
p robot.perform_command(right)
p robot.perform_command(right)

report = ReportCommand.new
robot.perform_command(report)
