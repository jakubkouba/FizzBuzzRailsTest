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

  it "returns 1" do
    args = {
        page: 2,
        per_page: 10
    }
    my_fizz_buzz = MyFizzBuzz.new(args)
    expect(my_fizz_buzz.get_values).to be == 1
  end

end