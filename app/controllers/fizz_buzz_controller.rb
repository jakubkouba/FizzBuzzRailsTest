class FizzBuzzController < ApplicationController

  def index
    @facade = fizz_buzz_index_facade.to_h
    @facade[:pages] = fizz_buzz_index_facade.pages
  end

  def listing_params
    {
        page:     params[:page].nil? ? DEF_PAGE_NUM : params[:page].to_i ,
        per_page: params[:per_page].nil? ? DEF_PER_PAGE_NUM : params[:per_page].to_i
    }
  end

  def fizz_buzz_index_facade
    index_view = Struct.new(:values, :page, :per_page, :max_items) do

      def pages
        (self.max_items / self.per_page).to_i
      end

    end

    index_view.new(fizz_buzz_values, *listing_params.values, MAX_ITEMS)
  end

  def fizz_buzz_values
     MyFizzBuzz.new(listing_params).fizz_buzz_page
  end

end
