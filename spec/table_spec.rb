require "table"

describe Table do
  let(:table) {described_class.new(2, 3)}

  it "displays an image of pixels with the given number of columns and rows" do
    expect(table.display).to eq "OO\nOO\nOO"
  end

  it "raises an error if the dimensions given aren't in the valid range (1 - 250)" do
    expect {described_class.new(251, 100)}.to raise_error "Please enter a number between 1-250"
  end

  it "colors a pixel" do
    table.color_pixel(1, 2, "X")
    expect(table.display).to eq "OO\nXO\nOO"
  end

  it "clears itself" do
    table.color_pixel(1, 3, "X")
    table.clear
    expect(table.display).to eq "OO\nOO\nOO"
  end


end
