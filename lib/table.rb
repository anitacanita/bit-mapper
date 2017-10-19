require_relative 'pixel.rb'

class Table
attr_reader :columns, :rows

  def initialize(column_number, row_number)
    @columns = Array.new(column_number, Pixel.new)
    @rows = Array.new(row_number, columns)
  end

  def show
    rows.map do |row|
      row.map{ |pixel| pixel.color}.join
    end.join("\n")
  end

end
