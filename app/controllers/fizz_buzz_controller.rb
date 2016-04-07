class FizzBuzzController < ApplicationController

  def index
    @facade                    = fizz_buzz_index_facade.to_h
    @facade[:pages]            = fizz_buzz_index_facade.pages
    @facade[:per_page_options] = PER_PAGE_OPTIONS.map { |val| [val, val] }

    from = @facade[:values][0][:number]
    to = @facade[:values][-1][:number]
    @facade[:likes] = Like.get_likes(from, to)

  end

  # Calls Like model to toggle like
  # Like model should have validation not allowing to save 0
  # and use save! to produce Exception to work it properly
  #
  # This might create record with 0 number and marked number as liked
  def like
    begin
      liked = Like.like_toggle(params[:number_to_like])
      render json: {res: true, liked: liked}
    rescue
      render json: {res: false}
    end
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
