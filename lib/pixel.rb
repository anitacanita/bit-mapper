class Pixel
  attr_accessor :color

  def initialize
    @color = "O"
  end

  def change_color(shade)
    self.color = shade
  end

end
