require_relative "image"
require_relative "pixel"
require_relative "editor"

class EditorRunner

  def initialize
    @editor = Editor.new
  end

  def run(file)
    raise "Please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      action, *arguments = line.split
      execute(action, arguments)
    end
  end

  def execute(action, arguments)
    case action
    when "S"
      puts editor.show_image
    when "C"
      editor.clear_image
    when "I"
      call_create_image(arguments)
    when "L"
      call_color_pixel(arguments)
    when "V"
      call_color_vertical_line(arguments)
    when "H"
      call_color_horizontal_line(arguments)
    else
      raise "Unknown action :("
    end
  end

private
attr_reader :editor

  def call_create_image(arguments)
    m = arguments[0].to_i
    n = arguments[1].to_i
    editor.create_image(m, n)
  end

  def call_color_pixel(arguments)
    x = arguments[0].to_i
    y = arguments[1].to_i
    c = arguments[-1]
    editor.color_pixel(x, y, c)
  end

  def call_color_vertical_line(arguments)
    x  = arguments[0].to_i
    y1 = arguments[1].to_i
    y2 = arguments[2].to_i
    c  = arguments[-1]
    editor.color_vertical_line(x, y1, y2, c)
  end

  def call_color_horizontal_line(arguments)
    x1 = arguments[0].to_i
    x2 = arguments[1].to_i
    y  = arguments[2].to_i
    c  = arguments[-1]
    editor.color_horizontal_line(x1, x2, y, c)
  end
end
