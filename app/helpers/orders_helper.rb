module OrdersHelper
  def link_to_add_rate(f, object)
    content = render('rate_form', f: f)
    link_to('#', class: 'btn btn-info', id: :add_rate_link, data: {content: "#{content}"}) do
      fa_icon("plus") + ' ' + t('app.rates.new-button')
    end
  end
  
  def link_to_delete_rate(f, object)
    link_to('#', class: 'btn btn-danger', id: :delete_rate_link) do
      fa_icon("minus") + ' ' + t('app.rates.cncl-button')
    end
  end
end