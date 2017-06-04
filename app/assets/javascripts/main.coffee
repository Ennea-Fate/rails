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
      $('.panel-body#nested_attributes').empty()
      content = $('.panel-body#nested_attributes').data('content-form')
      $('.panel-body#nested_attributes').append(content)
      $('[name = "driver[auto_attributes][id]"]').remove()
      $('[name = "order[rate_attributes][id]"]').remove()
      window.datepicker_activation()
    else
      if(!!!$('.panel-body#nested_attributes').data('content-form'))
        html = $('.panel-body#nested_attributes').html()
        $('.panel-body#nested_attributes').data('content-form', html)
      $('.panel-body#nested_attributes').empty()
      content = $('.panel-body#nested_attributes').data('content-select')
      $('.panel-body#nested_attributes').append(content)
      
@switch_change = ->
  $('[type = "checkbox"]#change').bootstrapSwitch()
  $('[type = "checkbox"]#change').on 'switchChange.bootstrapSwitch', (event, state) ->
    if(state == true)
      html = $('.panel-body#nested_attributes').html()
      $('.panel-body#nested_attributes').data('content-form', html)
      $('.panel-body#nested_attributes').empty()
      $('[type = "checkbox"]#new_or_select').bootstrapSwitch("toggleDisabled", false, false)
      $('[type = "checkbox"]#new_or_select').bootstrapSwitch('toggleState', false, false)
      $('#link_to_auto_new').click()
      $('#link_to_rate_new').click()
    else
      content = $('.panel-body#nested_attributes').data('content-form')
      $('.panel-body#nested_attributes').html(content)
      $('[type = "checkbox"]#new_or_select').bootstrapSwitch("toggleDisabled", false, false)
      
@switch_remove = ->
  $('[type = "checkbox"]#remove').bootstrapSwitch()
  $('[type = "checkbox"]#remove').on 'switchChange.bootstrapSwitch', (event, state) ->
    if(state == true)
      $('[type = "checkbox"]#change').bootstrapSwitch('state', true, false)
      $('[type = "checkbox"]#change').bootstrapSwitch("toggleDisabled", true, false)
      $('[type = "hidden"]#remove').val(true)
      if($('#relation_count').val() > 1)
        $('[type = "submit"][name = "commit"]').prop( "disabled", true );
        $('.fa-question').parent().toggleClass('hidden')
        $('[data-toggle="tooltip"]').tooltip()
    else
      $('[type = "hidden"]#remove').val(false)
      $('[type = "checkbox"]#change').bootstrapSwitch("toggleDisabled", false, false)
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
