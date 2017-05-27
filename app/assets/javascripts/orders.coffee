@add_new_ru = ->
  $('#add_rate_link').on 'click', ->
    if(!($(this).hasClass('active')))
      $('#rate_select').remove()
      content = $(this).attr('data-content')
      $(this).toggleClass('active')
      $("#add-rate-place").after(content)
      if($('#select_rate_link').hasClass('active'))
        $('#select_rate_link').toggleClass('active')
        false
      if($('#order_submit').hasClass('disabled'))
        $('#order_submit').removeClass('disabled')
        $('#order_submit').prop('disabled', false)
        false
      false
    false
  false
  
@select_new_ru = ->
  $('#select_rate_link').on 'click', ->
    if(!($(this).hasClass('active')))
      $('#rate_field').remove()
      content = $(this).attr('data-content')
      $('#select-rate-place').after(content)
      $(this).toggleClass('active')
      if($('#add_rate_link').hasClass('active'))
        $('#add_rate_link').toggleClass('active')
        false
      if($('#order_submit').hasClass('disabled'))
        $('#order_submit').removeClass('disabled')
        $('#order_submit').prop('disabled', false)
        false
      false
    false
  false
  
  
ru_ready = ->
    window.select_new_ru()
    window.add_new_ru()
    window.remove_rate
$(document).on 'page:load', ru_ready
$(document).ready ru_ready
