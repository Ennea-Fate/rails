module OrdersHelper
  def link_to_add_rate(f, object)
    content = render('rate_form', f: f)
    link_to('#', class: 'btn btn-primary', id: :add_rate_link, data: {content: "#{content}"}) do
      fa_icon("plus") + ' ' + t('app.rates.new-button')
    end
  end
  
  def link_to_select_rate(f, object)
    content = render('rate_select', f: f)
    link_to('#', class: 'btn btn-primary', id: :select_rate_link, data: {content: "#{content}"}) do
      t('app.rates.slct-button')
    end
  end
end