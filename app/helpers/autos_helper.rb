module AutosHelper
  def auto_options()
    Auto.all.pluck('model, number ,id')
  end
end
