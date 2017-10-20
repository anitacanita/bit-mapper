class Editor
  
  OUT_OF_RANGE_ERROR = "The given coordinates are not in the image range"

  def create_image(length, width)
    @image = Image.new(length, width)
  end

  def show_image
    @image.display
  end

  def color_pixel(column, row, shade)
    raise OUT_OF_RANGE_ERROR unless column_in_range?(column) && row_in_range?(row)

    @image.table[row-1][column-1].change_color(shade)
  end

  def color_vertical_line(column, start_row, end_row, shade)
    raise OUT_OF_RANGE_ERROR unless column_in_range?(column) && row_in_range?(start_row) && row_in_range?(start_row)

    @image.table[start_row-1..end_row-1].each do |row|
      row[column-1].change_color(shade)
    end
  end

  def color_horizontal_line(row, start_column, end_column, shade)
    raise OUT_OF_RANGE_ERROR unless row_in_range?(row) && column_in_range?(start_column) && column_in_range?(start_column)

    @image.table[row-1][start_column-1..end_column-1].each do |pixel|
       pixel.change_color(shade)
    end
  end

  def clear_image
    @image.table.map { |row| row.map { |pixel| pixel.reset} }
  end

  private

  def row_in_range?(row_number)
    row_number <= @image.rows && !row_number.zero?
  end

  def column_in_range?(column_number)
    column_number <= @image.columns && !column_number.zero?
  end

end
