require 'table'

describe Table do
  let(:table) {described_class.new(2, 3)}

  it "starts with a number of columns" do
    expect(table.columns.length).to eq 2
  end

  it "starts with a number of rows" do
    expect(table.rows.length).to eq 3
  end

  it "displays an image of pixels with the given number of columns and rows" do
    expect(table.show).to eq("OO\nOO\nOO")
  end

end
