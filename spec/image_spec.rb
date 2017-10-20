require "image"

describe Image do
  let(:image) {described_class.new(3, 3)}

  it "creates a table of pixels with a given number of rows and columns" do
    expect(image.display).to eq "OOO\nOOO\nOOO"
  end

end
