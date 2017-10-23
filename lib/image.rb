class Image
  attr_reader :table, :columns, :rows

  VALID_COLUMNS_RANGE = 1..250
  VALID_ROWS_RANGE = 1..250
  INVALID_NUMBER_ERROR = "Numbers should be between 1 and 250"

  def initialize(columns, rows)
    validate_input(columns, rows)

    @columns = columns
    @rows = rows
    @table = create_table(columns, rows)
  end

  def display
    table.map do |row|
      row.map { |pixel| pixel.color }.join
    end.join("\n")
  end

private

  def create_table(columns, rows)
    Array.new(rows) { Array.new(columns) {Pixel.new} }
  end

  def valid_range?(columns, rows)
    VALID_COLUMNS_RANGE.include?(columns) && VALID_ROWS_RANGE.include?(rows)
  end

  def validate_input(columns, rows)
    raise INVALID_NUMBER_ERROR unless valid_range?(columns, rows)
  end

end
