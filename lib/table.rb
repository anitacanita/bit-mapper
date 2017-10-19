require_relative "pixel.rb"

class Table

attr_reader :columns, :rows

VALID_COLUMNS_RANGE = 1..250
VALID_ROWS_RANGE = 1..250

  def initialize(column_number, row_number)
    raise "Please enter a number between 1-250" unless VALID_COLUMNS_RANGE.include?(column_number) && VALID_ROWS_RANGE.include?(row_number)

    @columns = Array.new(column_number, Pixel.new)
    @rows = Array.new(row_number, columns)
  end

  def show
    rows.map do |row|
      row.map{ |pixel| pixel.color}.join
    end.join("\n")
  end
end
