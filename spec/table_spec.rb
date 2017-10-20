require "table"

describe Table do
  let(:table) {described_class.new(3, 3)}

  it "displays an image of pixels with the given number of columns and rows" do
    expect(table.display).to eq "OOO\nOOO\nOOO"
  end

  it "colors a pixel"  do
    table.color_pixel(1, 2, "X")
    expect(table.display).to eq "OOO\nXOO\nOOO"
  end

  it "colors a vertical segment of pixels" do
    table.color_vertical_line(1, 1, 3, "X")
    expect(table.display).to eq "XOO\nXOO\nXOO"
  end

  it "colors a horizontal segment of pixels" do
    table.color_horizontal_line(2, 1, 2, "X")
    expect(table.display).to eq "OOO\nXXO\nOOO"
  end

  it "clears itself" do
    table.color_pixel(1, 3, "X")
    table.clear
    expect(table.display).to eq "OOO\nOOO\nOOO"
  end

  context "error handling" do
    it "raises an error if the dimensions given aren't in the valid range (1 - 250)" do
      expect {described_class.new(251, 100)}.to raise_error "Please enter a number between 1-250"
    end

    it "raises an error if pixel coordinates are outside the image range" do
      expect{table.color_pixel(2, 0, "X")}.to raise_error "The given coordinates are not in the image range"
    end

    it "raises an error if line coordinates are outside the image range" do
      expect{table.color_horizontal_line(4, 0, 2, "X")}.to raise_error "The given coordinates are not in the image range"
    end
  end

end
