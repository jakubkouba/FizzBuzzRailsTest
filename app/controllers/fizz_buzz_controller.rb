class FizzBuzzController < ApplicationController

  def index
    @my_fizz_buzz = MyFizzBuzz.new(listing_params)
    @values = @my_fizz_buzz.fizz_buzz_page
  end

  def listing_params
    {
        page:     params[:page].nil? ? 1 : params[:page] ,
        per_page: params[:per_page].nil? ? 100 : params[:per_page]
    }
  end

end
