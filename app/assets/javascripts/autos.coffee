# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $ ->
    $('#datepicker_year').datepicker
      format: "yyyy",
      startView: 2,
      minViewMode: 2,
      maxViewMode: 3,
      autoclose: true
      toggleActive: true
