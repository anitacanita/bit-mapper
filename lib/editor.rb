class Editor

  OUT_OF_BOUNDARIES_ERROR = "Coordinates are outside image boundaries"
  INVALID_COLOR_ERROR = "Color should be a capital letter"
  NO_IMAGE_ERROR = "No image has been created"

  def create_image(width, height)
    @image = Image.new(width, height)
  end

  def show_image
    check_image
    @image.display
  end

  def color_pixel(column, row, shade)
    check_image
    validate_color(shade)
    validate_coordinates(column, row)

    @image.table[offset(row)][offset(column)].change_color(shade)
  end

  def color_vertical_line(column, start_row, end_row, shade)
    check_image
    validate_color(shade)
    validate_coordinates(column, start_row)
    validate_coordinates(column, end_row)

    @image.table[get_line(start_row, end_row)].each do |row|
      row[offset(column)].change_color(shade)
    end
  end

  def color_horizontal_line(start_column, end_column, row, shade)
    check_image
    validate_color(shade)
    validate_coordinates(start_column, row)
    validate_coordinates(end_column, row)

    @image.table[offset(row)][get_line(start_column, end_column)].each do |pixel|
       pixel.change_color(shade)
    end
  end

  def bucket_fill(column, row, shade, shade_to_replace = nil)
    if shade_to_replace == nil
      shade_to_replace = get_color_at(column, row)
    end

    color_pixel(column, row, shade)

    if column_in_range?(column+1) && get_color_at(column+1, row) == shade_to_replace
      bucket_fill(column+1, row, shade, shade_to_replace)
    end

    if column_in_range?(column-1) && get_color_at(column-1, row) == shade_to_replace
      bucket_fill(column-1, row, shade, shade_to_replace)
    end

    if row_in_range?(row+1) && get_color_at(column, row+1) == shade_to_replace
      bucket_fill(column, row+1, shade, shade_to_replace)
    end

    if row_in_range?(row-1) && get_color_at(column, row-1) == shade_to_replace
      bucket_fill(column, row-1, shade, shade_to_replace)
    end

  end

  def clear_image
    check_image

    @image.table.map { |row| row.map { |pixel| pixel.reset} }
  end

  private

  def offset(value)
    value-1
  end

  def get_line(start_value, end_value)
    coordinates = [offset(start_value), offset(end_value)].sort
    coordinates[0]..coordinates[1]
  end

  def row_in_range?(row)
    row <= @image.rows && row > 0
  end

  def column_in_range?(column)
    column <= @image.columns && column > 0
  end

  def valid_coordinates?(column, row)
    column_in_range?(column) && row_in_range?(row)
  end

  def validate_coordinates(column, row)
    raise OUT_OF_BOUNDARIES_ERROR unless valid_coordinates?(column, row)
  end

  def valid_color?(shade)
    /^[A-Z]$/.match(shade.to_s)
  end

  def validate_color(shade)
    raise INVALID_COLOR_ERROR unless valid_color?(shade)
  end

  def image_exists?
    !@image.nil?
  end

  def check_image
    raise NO_IMAGE_ERROR unless image_exists?
  end

  def get_color_at(column, row)
    @image.table[offset(row)][offset(column)].color
  end

end
