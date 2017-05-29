loader_f = ->
  $('.long, .longpaginate .page a, .longpaginate .next a, .longpaginate .prev a, .longpaginate .last a, .longpaginate .first a').on 'click', ->
    $('#loader').modal('show')
    true
  true
@datepicker_activation = ->
  window.datepicker_activation_by_item($(document))
@datepicker_activation_by_item = (item)->
  item.find('.datepicker').datetimepicker({locale: 'ru', format: 'DD.MM.YYYY'})
  item.find('.timepicker').datetimepicker({locale: 'ru', format: 'HH:mm', defaultDate: ""})
  item.find('.yearpicker').datetimepicker({locale: 'ru', format: 'YYYY', defaultDate: ""})
  
@switch_new_or_select = ->
  $("[type = 'checkbox']#new_or_select").bootstrapSwitch()
  $("[type = 'checkbox']#new_or_select").on ('switchChange.bootstrapSwitch'), (event, state) ->
    if(state == true)
      $('div#select_object_field').empty()
      content = $('div#new_object_fields').attr('data-content')
      $('div#new_object_fields').append(content)
      window.datepicker_activation()
    else
      $('div#new_object_fields').empty()
      content = $('div#select_object_field').attr('data-content')
      $('div#select_object_field').append(content)
      
@switch_change = ->
  $('[type = "checkbox"]#change').bootstrapSwitch()
  $('[type = "checkbox"]#change').on 'switchChange.bootstrapSwitch', (event, state) ->
    if(state == true)
      html = $('.panel-body#nested_attributes').html()
      $('.panel-body#nested_attributes').data('content', html)
      $('.panel-body#nested_attributes').empty()
      $('[type = "checkbox"]#new_or_select').parent().parent().parent().toggleClass('hidden')
      $('[type = "checkbox"]#new_or_select').bootstrapSwitch('indeterminate', false, false)
    else
      content = $('.panel-body#nested_attributes').data('content')
      $('.panel-body#nested_attributes').html(content)
      $('[type = "checkbox"]#new_or_select').parent().parent().parent().toggleClass('hidden')
      $('div#new_object_fields').empty()
      $('div#select_object_field').empty()
      
@switch_remove = ->
  $('[type = "checkbox"]#remove').bootstrapSwitch()
  $('[type = "checkbox"]#remove').on 'switchChange.bootstrapSwitch', (event, state) ->
    if(state == true)
      $('[type = "checkbox"]#change').bootstrapSwitch('state', true, false)
      $('[type = "hidden"]#remove').val(true)
      if($('#relation_count').val() > 1)
        $('[type = "submit"][name = "commit"]').prop( "disabled", true );
        $('.fa-question').parent().toggleClass('hidden')
        $('[data-toggle="tooltip"]').tooltip()
    else
      $('[type = "hidden"]#remove').val(false)
      if($('#relation_count').val() > 1)
        $('[type = "submit"][name = "commit"]').prop( "disabled", false );
        $('.fa-question').parent().toggleClass('hidden')

  
  
app_ready_f = ->
  loader_f()
  window.datepicker_activation()
  window.switch_change()
  window.switch_remove()
  window.switch_new_or_select()

$(document).ready app_ready_f
$(document).on 'page:load', app_ready_f
