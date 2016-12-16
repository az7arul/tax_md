## Setup

Unzip the tax_md-master.zip file and cd into it.

No dependencies are needed to run `bin/tax_md.rb` except a recent ruby version ( ruby 2.2.1p85 was used to write the solution )

To install Rspec and Guard, run 

`bundle install` inside the directory.

run `bundle exec rspec spec/` to run the tests.


## Usage

You need to pass a file which contains inputs of the form:

Quantity, Product, Price
1, imported bottle of perfume, 27.99
1, bottle of perfume, 18.99
1, packet of headache pills, 9.75
1, imported box of chocolates, 11.25

No error handling has been done on the file format. Run

`$bin/tax_md.rb <input_file_path>` to execute the program. 3 sample input files are provided in sample/input directory.