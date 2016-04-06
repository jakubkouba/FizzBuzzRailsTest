class MyFizzBuzz

  def initialize(args)
    args      = defaults.merge(args)
    @page     = args[:page]
    @per_page = args[:per_page]

  end

  def defaults
    {
        page:     1,
        per_page: 10
    }
  end

end