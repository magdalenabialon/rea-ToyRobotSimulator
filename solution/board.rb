class Board

  attr_reader :size_X, :size_Y

  def initialize(size_X=5, size_Y=5)
    @size_X = size_X
    @size_Y = size_Y
  end
  
end