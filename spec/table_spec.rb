require "table"

describe Table do
  let(:table) {described_class.new(2, 3)}

  it "displays an image of pixels with the given number of columns and rows" do
    expect(table.display).to eq "OO\nOO\nOO"
  end

  it "colors a pixel"  do
    table.color_pixel(1, 2, "X")
    expect(table.display).to eq "OO\nXO\nOO"
  end

  it "colors a vertical segment of pixels" do
    table.color_vertical_line(1, 1, 3, "X")
    expect(table.display).to eq "XO\nXO\nXO"
  end

  it "clears itself" do
    table.color_pixel(1, 3, "X")
    table.clear
    expect(table.display).to eq "OO\nOO\nOO"
  end

  context "error handling" do
    it "raises an error if the dimensions given aren't in the valid range (1 - 250)" do
      expect {described_class.new(251, 100)}.to raise_error "Please enter a number between 1-250"
    end

    it "raises an error if pixel coordinates are outside the image range" do
      expect{table.color_pixel(2, 0, "X")}.to raise_error "The given coordinates are not in the image range"
    end
  end

end
