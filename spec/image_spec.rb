require "image"

describe Image do
  let(:image) {described_class.new(3, 3)}

  it "creates a table of pixels with a given number of rows and columns" do
    expect(image.display).to eq "OOO\nOOO\nOOO"
  end

  it "raises an error if the dimensions given aren't in the valid range (1 - 250)" do
    expect {described_class.new(251, 100)}.to raise_error "Enter a number between 1-250"
  end

end
