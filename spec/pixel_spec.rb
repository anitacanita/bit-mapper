require "pixel"

describe Pixel do
  let(:pixel) {described_class.new}

  it "starts with the color O" do
    expect(pixel.color).to eq("O")
  end

  it "can change its color" do
    pixel.change_color("A")
    expect(pixel.color).to eq("A")
  end

  it "it can revert back to its starting color" do
    pixel.change_color("A")
    pixel.reset
    expect(pixel.color).to eq("O")
  end

end
