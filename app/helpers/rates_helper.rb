module RatesHelper
  def rate_options()
    Rate.all.pluck('name, id')
  end
end
