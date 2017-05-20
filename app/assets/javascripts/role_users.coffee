# nested_start
# Удаление одной роли
@delete_one_ru = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()
# Включаем все кнопки удаления
@del_all_rus = ->
  $('a.remove_role').on 'click', ->
    window.delete_one_ru($(this))
    false
  false
# Включаем кнопку добавления роли
@add_new_ru = ->
  $('#add_role_link').on 'click', ->
    # Подменяем временный id с фразой new_ru на случайной число
    new_id = new Date().getTime()
    regexp = new RegExp("new_role", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    # Если бы были даты с datepicker-ом 
    # window.datepicker_activation_by_item(panel)
    # Включаем у новой роли кнопку удаления
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.remove_role').on 'click', ->
      window.delete_one_ru($(this))
      false    
    false
# Запуск всего вышеописанного
ru_ready = ->
  window.add_new_ru()
  window.del_all_rus()
$(document).on 'page:load', ru_ready # Включаем при ajax обновлении страницы
$(document).ready ru_ready # Включаем при обычном обновлении страницы
# nested_finish
