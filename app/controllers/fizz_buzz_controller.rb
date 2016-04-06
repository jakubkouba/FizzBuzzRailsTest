class FizzBuzzController < ApplicationController

  def index
    @my_fizz_buzz = MyFizzBuzz.new(listing_params)
    @values       = @my_fizz_buzz.fizz_buzz_page
    @page         = listing_params[:page]
    @per_page     = listing_params[:per_page]
    @max_items    = 100_000
  end

  def listing_params
    {
        page:     params[:page].nil? ? 1 : params[:page].to_i ,
        per_page: params[:per_page].nil? ? 100 : params[:per_page].to_i
    }
  end

end
