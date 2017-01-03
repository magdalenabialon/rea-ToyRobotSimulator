
class Robot
  
  def place(x,y,face)
    @x = x
    @y = y
    @face = face
    [@x,@y,@face]
  end

end


# robot = Robot.new
# p robot.place(0,0,'NORTH')