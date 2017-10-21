require_relative "image"
require_relative "pixel"
require_relative "editor"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when "S" #seing if it works with a table of 2x3
        editor = Editor.new
        editor.create_image(20, 20)
        puts editor.show_image
      else
        puts "unrecognised command :("
      end
    end
  end
end
