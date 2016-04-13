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
    options = { fizz: 3, buzz: 5 }.merge(options)
    ret = ''
    options.each { |label, number| ret += label.to_s.capitalize if val % number == 0 }
    ret.empty? ? val : ret
  end

  def defaults
    {
        page:     1,
        per_page: 10
    }
  end

end