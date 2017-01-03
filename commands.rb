
class Robot
  
  def place(x,y,face)
    if (0..5) === x && (0..5) === y && ['NORTH','SOUTH','EAST','WEST'].include?(face)
      @x = x
      @y = y
      @face = face
      [@x,@y,@face]
    else
      "X and Y must be in 0 to 5 (for X) and 5 (for Y) range and face must be north south east or west"
    end
  end

end


robot = Robot.new
# p robot.place(0,0,'NORTH')
# p robot.place(10,0,'NORTH')
# p robot.place(1,0,'sth')