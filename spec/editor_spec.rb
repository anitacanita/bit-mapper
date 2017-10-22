require "editor"

describe Editor do
  let(:editor) {described_class.new}

  context "When an image has been created" do
    before(:each) {editor.create_image(3,3)}

    it "displays an image of pixels with the given width and length" do
      expect(editor.show_image).to eq "OOO\nOOO\nOOO"
    end

    it "colors a pixel"  do
      editor.color_pixel(1, 2, "X")
      expect(editor.show_image).to eq "OOO\nXOO\nOOO"
    end

    it "colors a vertical segment of pixels" do
      editor.color_vertical_line(1, 1, 3, "X")
      expect(editor.show_image).to eq "XOO\nXOO\nXOO"
    end

    it "colors a horizontal segment of pixels" do
      editor.color_horizontal_line(1, 2, 2, "X")
      expect(editor.show_image).to eq "OOO\nXXO\nOOO"
    end

    it "clears the image" do
      editor.color_horizontal_line(2, 1, 2, "X")
      editor.clear_image
      expect(editor.show_image).to eq "OOO\nOOO\nOOO"
    end

    it "raises an error if pixel coordinates are outside the image range" do
      expect{editor.color_pixel(2, 0, "X")}.to raise_error "The given coordinates are not in the image range"
    end

    it "raises an error if vertical line coordinates are outside the image range" do
      expect{editor.color_vertical_line(4, 0, 5, "X")}.to raise_error "The given coordinates are not in the image range"
    end

    it "raises an error if horizontal line coordinates are outside the image range" do
      expect{editor.color_horizontal_line(0, 6, 5, "X")}.to raise_error "The given coordinates are not in the image range"
    end

    it "raises an error if given color shade is in lower case" do
      expect{editor.color_pixel(2, 1, "a")}.to raise_error "Color should be a capital letter"
    end

    it "raises an error if given color shade is a number" do
      expect{editor.color_pixel(2, 1, "1")}.to raise_error "Color should be a capital letter"
    end

    it "raises an error if given color shade is an integer" do
      expect{editor.color_pixel(2, 1, 8)}.to raise_error "Color should be a capital letter"
    end
  end

  context "when image hasn't been created" do

    it "raises an error when trying to show image" do
      expect{editor.show_image}.to raise_error "No image has been created"
    end

    it "raises an error when trying to clear image" do
      expect{editor.clear_image}.to raise_error "No image has been created"
    end

    it "raises an error when trying to color a pixel" do
     expect{editor.clear_image}.to raise_error "No image has been created"
   end

    it "raises an error when trying to color a vertical line" do
      expect{editor.color_vertical_line(1, 1, 3, "X")}.to raise_error "No image has been created"
    end

    it "raises an error when trying to color a horizontal line" do
      expect{editor.color_pixel(1, 2, "X")}.to raise_error "No image has been created"
    end

  end

end
