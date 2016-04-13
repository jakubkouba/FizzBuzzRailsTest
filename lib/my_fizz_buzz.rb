class MyFizzBuzz

  def initialize(args)
    args      = defaults.merge(args)
    @page     = args[:page]
    @per_page = args[:per_page]

  end

  def fizz_buzz_page
    begin_at = ((@page - 1) * @per_page) + 1
    stop_at = @page * @per_page
    (begin_at..stop_at).to_a.map { |val| { number: val, fizz_buzz: fizz_buzz(val) } }
  end

  def fizz_buzz(val, options = {})
    options = { 3 => 'Fizz', 5 => 'Buzz' }.merge(options)
    ret = ''
    options.each { |number, label| ret += label if val % number == 0 }
    ret.empty? ? val : ret
  end

  def defaults
    {
        page:     1,
        per_page: 10
    }
  end

end