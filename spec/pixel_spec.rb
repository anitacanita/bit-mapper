require 'pixel'

describe Pixel do
  let(:pixel) {described_class.new}

  it "starts with the color O" do
    expect(pixel.color).to eq("O")
  end

end
