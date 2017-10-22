require "editor_runner"

describe EditorRunner do
  let(:editor_runner) {described_class.new}

  it "raises error if no file is given" do
    expect{editor_runner.run(nil)}.to raise_error "Please provide correct file"
  end

  context "with the default file" do
    let(:file) {'examples/show.txt'}

    it "reads instructions from the given file" do
      expect{editor_runner.run(file)}.to output("OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n").to_stdout
    end
end

  context "clear image instructions" do
    let(:file) {'examples/clear.txt'}

    it "clears an image" do
       expect{editor_runner.run(file)}.to output("OOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\nOOOOO\n").to_stdout
     end
  end

  context "unknown instructions" do
    let(:file) {'examples/unknown_action.txt'}

    it "raises an error" do
       expect{editor_runner.run(file)}.to raise_error "Unknown action :("
     end
  end
end
