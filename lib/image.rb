class Image
  attr_accessor :table, :columns, :rows

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

private

  def create_table(columns, rows)
    Array.new(rows) { Array.new(columns) {Pixel.new} }
  end

end
