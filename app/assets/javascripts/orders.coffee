@search_slider_init = ->
  $('[name = "search[lenght_of_the_route]"]').slider()
  $('[name = "search[PPK]"]').slider()

ru_ready = ->
    window.search_slider_init()
$(document).on 'page:load', ru_ready
$(document).ready ru_ready
