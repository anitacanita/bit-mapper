require "editor"

describe Editor do
  let(:editor) {described_class.new}

  it "displays an image of pixels with the given width and length" do
    editor.create_image(3,3)
    expect(editor.show_image).to eq "OOO\nOOO\nOOO"
  end

  it "colors a pixel"  do
    editor.create_image(3,3)
    editor.color_pixel(1, 2, "X")
    expect(editor.show_image).to eq "OOO\nXOO\nOOO"
  end

  it "colors a vertical segment of pixels" do
    editor.create_image(3,3)
    editor.color_vertical_line(1, 1, 3, "X")
    expect(editor.show_image).to eq "XOO\nXOO\nXOO"
  end

  it "colors a horizontal segment of pixels" do
    editor.create_image(3,3)
    editor.color_horizontal_line(2, 1, 2, "X")
    expect(editor.show_image).to eq "OOO\nXXO\nOOO"
  end

  it "clears the image" do
    editor.create_image(3,3)
    editor.color_horizontal_line(2, 1, 2, "X")
    editor.clear_image
    expect(editor.show_image).to eq "OOO\nOOO\nOOO"
  end

  context "error handling" do
    it "raises an error if pixel coordinates are outside the image range" do
      editor.create_image(3,3)
      expect{editor.color_pixel(2, 0, "X")}.to raise_error "The given coordinates are not in the image range"
    end

    it "raises an error if line coordinates are outside the image range" do
      editor.create_image(3,3)
      expect{editor.color_vertical_line(4, 0, 2, "X")}.to raise_error "The given coordinates are not in the image range"
    end
  end

end
