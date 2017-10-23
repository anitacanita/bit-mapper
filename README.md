# Bitmap editor

Ruby program that simulates a basic interactive bitmap editor. Bitmaps are represented as a matrix of pixels with each element representing a colour.

### Getting started
1. Clone this repo
2. Run `bundle install` to install gems

### Tests and code coverage

`rspec` runs the entire test suite. I included [SimpleCov](https://github.com/colszowka/simplecov) in the project so I could see a simple code coverage report in the tests output.

For more detailed information on this project's code coverage, check SimpleCov's dashboard by opening coverage/index.html in a browser. *Note that the files will only be generated after running the tests.*

## Using the editor

### Commands
There are 6 supported commands:

- I M N : Creates a new M x N image with all pixels coloured white (O).
- C : Clears the table, setting all pixels to white (O).
- L X Y C : Colours the pixel (X,Y) with colour C.
- V X Y1 Y2 C : Draws a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
- H X1 X2 Y C : Draws a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
- S : Shows the contents of the current image.

### Running the commands
Pass an input file containing the commands to `bin/bitmap_editor`, running it like so:

`$ bin/bitmap_editor examples/show.txt`

#### Example

*Input File:*

`I 5 5`

`L 1 3 A`

`V 2 3 5 W`

`H 3 5 2 Z`

`S`

*Output:*

`OOOOO`

`OOZZZ`

`AWOOO`

`OWOOO`

`OWOOO`
