require 'rails_helper'

# RSpec.configure do |config|
#   config.infer_spec_type_from_file_location!
# end

# I Couldn't make Rspec autoload MyFizzBuzz class
# file locations seems to be ok, even given implicit configuration
# I don't know what I oversee
# I can't require it even by relative way so I had to use abs path

require Rails.root.join('lib/my_fizz_buzz')

RSpec.describe "MyFizzBuzz" do

  before do
    args          = {
        page:     2,
        per_page: 10
    }
    @my_fizz_buzz = MyFizzBuzz.new(args)
  end

  describe "#fizz_buzz" do

    it "returns Fizz if value % 3 == 0" do
      expect(@my_fizz_buzz.fizz_buzz(9)).to be == 'Fizz'
    end

    it "returns Buzz if value % 5 == 0" do
      expect(@my_fizz_buzz.fizz_buzz(25)).to be == 'Buzz'
    end

    it "returns FizzBuzz if value % 5 == 0 and value % 3 == 0" do
      expect(@my_fizz_buzz.fizz_buzz(15)).to be == 'FizzBuzz'
    end

    it "returns value if value % 5 != 0 and value % 3 != 0" do
      expect(@my_fizz_buzz.fizz_buzz(13)).to be == 13
    end

    it "returns Fizz if val = 7 and option is { 7 => 'Fizz' }" do
      expect(@my_fizz_buzz.fizz_buzz(7, { 7 => 'Fizz' }))
    end

  end

  describe "#fizz_buzz_page" do

    subject(:fizz_buzz_page) { @my_fizz_buzz.fizz_buzz_page }

    it { is_expected.to start_with({ number: 11 , fizz_buzz: 11 }) }

    it { is_expected.to end_with({ number: 20 , fizz_buzz: 'Buzz' }) }

    it "returns array of size 10" do
      expect(fizz_buzz_page.size).to be == 10
    end

    it "returns array of hashes like { number => number , fizz_buzz => Fizz | Buzz | FizzBuzz | number }" do
      expect(fizz_buzz_page).to be_an Array
      fizz_buzz_page.each do |val|
        expect(val).to be_an Hash
      end
    end

  end


end