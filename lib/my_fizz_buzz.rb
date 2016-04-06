class MyFizzBuzz

  def initialize(args)
    args      = defaults.merge(args)
    @page     = args[:page]
    @per_page = args[:per_page]

  end

  def get_range
    begin_at = (@page - 1) * @per_page
    stop_at = @page * @per_page
    (begin_at..stop_at).to_a.each do |val|

    end
  end

  def fizz_buzz(val)
    ret = ''
    ret += 'Fizz' if val % 3 == 0
    ret += 'Buzz' if val % 5 == 0
    ret.empty? ? val : ret
  end

  def defaults
    {
        page:     1,
        per_page: 10
    }
  end

end