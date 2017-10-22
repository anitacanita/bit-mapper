class Editor

  OUT_OF_RANGE_ERROR = "The given coordinates are not in the image range"
  INVALID_COLOR_ERROR = "Color should be a capital letter"
  NO_IMAGE_ERROR = "No image has been created"

  def create_image(length, width)
    @image = Image.new(length, width)
  end

  def show_image
    image_exists?
    @image.display
  end

  def color_pixel(column, row, shade)
    image_exists?
    valid_color?(shade)
    valid_coordinates?(column, row)

    @image.table[row-1][column-1].change_color(shade)
  end

  def color_vertical_line(column, start_row, end_row, shade)
    image_exists?
    valid_color?(shade)
    valid_line_coordinates?([column, start_row], [column, end_row])

    @image.table[start_row-1..end_row-1].each do |row|
      row[column-1].change_color(shade)
    end
  end

  def color_horizontal_line(row, start_column, end_column, shade)
    image_exists?
    valid_color?(shade)
    valid_line_coordinates?([start_column, row], [end_column, row])

    @image.table[row-1][start_column-1..end_column-1].each do |pixel|
       pixel.change_color(shade)
    end
  end

  def clear_image
    image_exists?

    @image.table.map { |row| row.map { |pixel| pixel.reset} }
  end

  private

  def row_in_range?(row_number)
    row_number <= @image.rows && row_number.nonzero?
  end

  def column_in_range?(column_number)
    column_number <= @image.columns && column_number.nonzero?
  end

  def valid_coordinates?(column_number, row_number)
    raise ArgumentError, OUT_OF_RANGE_ERROR unless column_in_range?(column_number) && row_in_range?(row_number)
  end

  def valid_line_coordinates?(*coordinates)
    coordinates.all? { |column, row| valid_coordinates?(column, row) }
  end

  def valid_color?(shade)
    raise ArgumentError, INVALID_COLOR_ERROR unless /[A-Z]/.match(shade.to_s)
  end

  def image_exists?
    raise RuntimeError, NO_IMAGE_ERROR unless !@image.nil?
  end

end
