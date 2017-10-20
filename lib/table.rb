require_relative "pixel.rb"

class Table
  attr_accessor :table

  VALID_COLUMNS_RANGE = 1..250
  VALID_ROWS_RANGE = 1..250

  def initialize(columns, rows)
    raise "Please enter a number between 1-250" unless VALID_COLUMNS_RANGE.include?(columns) && VALID_ROWS_RANGE.include?(rows)

    @columns = columns
    @rows = rows
    @table = create_table(columns, rows)
  end

  def display
    @table.map do |row|
      row.map { |pixel| pixel.color }.join
    end.join("\n")
  end

  def color_pixel(column, row, shade)
    raise "The given coordinates are not in the image range" unless column_in_range?(column) && row_in_range?(row)

    @table[row-1][column-1].change_color(shade)
  end

  def color_vertical_line(column, start_row, end_row, shade)
    raise "The given coordinates are not in the image range" unless column_in_range?(column) && row_in_range?(start_row) && row_in_range?(start_row)

    @table[start_row-1..end_row-1].each do |row|
      row[column-1].change_color(shade)
    end
  end

  def clear
    @table.map { |row| row.map { |pixel| pixel.reset} }
  end

private

  def create_table(columns, rows)
    Array.new(rows) { Array.new(columns) {Pixel.new} }
  end

  def row_in_range?(row_number)
    row_number <= @rows && !row_number.zero?
  end

  def column_in_range?(column_number)
    column_number <= @columns && !column_number.zero?
  end

end
