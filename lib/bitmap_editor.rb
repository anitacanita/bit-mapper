require_relative 'table.rb'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S' #seing if it works with a table of 2x3
        puts Table.new(2,3).show
      else
        puts 'unrecognised command :('
      end
    end
  end
end
