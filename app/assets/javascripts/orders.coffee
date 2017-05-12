@add_new_ru = ->
  $('#add_rate_link').on 'click', ->
    $(this).hide()
    content = $(this).attr('data-content')
    $(this).parent().parent().after(content)
    false
  false
  
  $('#delete_rate_link').on 'click', ->
    ('#rate_field').replaceWith("<br>")
    ('#add_rate_link').show()
  false

ru_ready = ->
  window.add_new_ru()
$(document).ready ru_ready
$(document).on 'page:load', ru_ready
