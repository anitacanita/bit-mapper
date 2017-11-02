require "editor"

describe Editor do
  let(:editor) {described_class.new}

  context "When an image has been created" do
    before(:each) {editor.create_image(3,3)}

    let(:invalid_color) {"Color should be a capital letter"}
    let(:out_of_boundaries) {"Coordinates are outside image boundaries"}

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

    it "colors a vertical segment of pixels with reversed coordinates" do
      editor.color_vertical_line(1, 3, 1, "X")
      expect(editor.show_image).to eq "XOO\nXOO\nXOO"
    end

    it "colors a horizontal segment of pixels" do
      editor.color_horizontal_line(1, 2, 2, "X")
      expect(editor.show_image).to eq "OOO\nXXO\nOOO"
    end

    it "colors a horizontal segment of pixels with reversed coordinates" do
      editor.color_horizontal_line(2, 1, 2, "X")
      expect(editor.show_image).to eq "OOO\nXXO\nOOO"
    end

    it "clears the image" do
      editor.color_horizontal_line(2, 1, 2, "X")
      editor.clear_image
      expect(editor.show_image).to eq "OOO\nOOO\nOOO"
    end

    it "raises an error if pixel coordinates are outside the image boundaries" do
      expect{editor.color_pixel(2, 0, "X")}.to raise_error out_of_boundaries
    end

    it "raises an error if vertical line coordinates are outside the image boundaries" do
      expect{editor.color_vertical_line(0, 2, 1, "X")}.to raise_error out_of_boundaries
    end

    it "raises an error if horizontal line coordinates are outside the image boundaries" do
      expect{editor.color_horizontal_line(2, 3, -2, "X")}.to raise_error out_of_boundaries
    end

    it "raises an error if given color shade is in lower case" do
      expect{editor.color_pixel(2, 1, "a")}.to raise_error invalid_color
    end

    it "raises an error if given color shade is a number" do
      expect{editor.color_pixel(2, 1, "1")}.to raise_error invalid_color
    end

    it "raises an error if given color shade is an integer" do
      expect{editor.color_pixel(2, 1, 8)}.to raise_error invalid_color
    end

    it "raises an error if given color shade is a multiple character string" do
      expect{editor.color_pixel(2, 1, "LOL")}.to raise_error invalid_color
    end

    it "raises an error if given color shade has non-word characters" do
      expect{editor.color_pixel(2, 1, ":)")}.to raise_error invalid_color
    end
  end

  context "Bucket fill" do

    it "fills the pixel with a color" do
      editor.create_image(1,1)
      editor.bucket_fill(1, 1, "X")
      expect(editor.show_image).to eq "X"
    end

    it "fills a blank image with a color" do
      editor.create_image(2, 1)
      editor.bucket_fill(1, 1, "X")
      expect(editor.show_image).to eq "XX"
    end

    it "stops at a different color" do
      editor.create_image(3, 1)
      editor.color_pixel(2, 1, "Y")
      editor.bucket_fill(1, 1, "X")
      expect(editor.show_image).to eq "XYO"
    end

    it "fills an image correctly" do
      editor.create_image(4, 4)
      editor.color_pixel(3, 1, "Y")
      editor.color_pixel(3, 2, "Y")
      editor.color_pixel(1, 3, "Y")
      editor.color_pixel(2, 4, "Y")
      editor.bucket_fill(2, 2, "X")
      expect(editor.show_image).to eq "XXYX\nXXYX\nYXXX\nOYXX"
    end

  end

  context "When an image hasn't been created" do

    let(:no_image) {"No image has been created"}

    it "raises an error when trying to show image" do
      expect{editor.show_image}.to raise_error no_image
    end

    it "raises an error when trying to clear image" do
      expect{editor.clear_image}.to raise_error no_image
    end

    it "raises an error when trying to color a pixel" do
     expect{editor.clear_image}.to raise_error no_image
   end

    it "raises an error when trying to color a vertical line" do
      expect{editor.color_vertical_line(1, 1, 3, "X")}.to raise_error no_image
    end

    it "raises an error when trying to color a horizontal line" do
      expect{editor.color_pixel(1, 2, "X")}.to raise_error no_image
    end

  end

end
