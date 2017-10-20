class Pixel
  attr_accessor :color

  def initialize
    @color = reset
  end

  def change_color(shade)
    self.color = shade
  end

  def reset
    self.color = "O"
  end

end
