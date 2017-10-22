# Bitmap editor

### Getting started
1. Clone this repo
2. Run `bundle install` to install gems

### Tests
`rspec` runs the entire test suite and you can see a simple code coverage report in the output.

For more detailed information on the code coverage, check SimpleCov's dashboard by opening coverage/index.html in a browser. *Note that the files will only be generated after running the tests.*

### Running the editor

To run the application, supply a command file like so:

`$ bin/bitmap_editor examples/show.txt`

----

##### TO-DO

**Commands:**
- [x] Create a new image
- [x] Clear the table
- [x] Color a single pixel
- [x] Draw a vertical line
- [x] Draw a horizontal line
- [x] Show image

**Other stuff:**
- [ ] Improve README
- [x] Improve error handling
- [x] Validate coordinates range
- [x] Validate input type
- [x] Better names - there's confusion between table and image
- [x] Make it work with an input file
- [x] Integration test
