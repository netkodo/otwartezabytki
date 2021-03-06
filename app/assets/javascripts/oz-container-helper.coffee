#function to remove nonbootstrap container class
$(document).ready ->
  if $('.js-remove-their-container').length > 0
    $('.their-container').removeClass 'their-container'
  return

# setting map width in widgets
$(document).ready ->
  map = $('.js-map-container')
  map_width = map.width()
  sidebar_height = $('.walking-guide__sidebar').height()
  if $(document).width() < 992
    map.css 'height', "#{map_width}px"
  else
    map.css 'height', "#{sidebar_height}px"

#removing fancybox container if ajax goes to something othe than carousel
jQuery.initializer '.js-remove-if-not-carousel', ->
  class_list = $('.js-remove-if-not-carousel')
  caro = $('.modal-body')
  if caro
    class_list.each ->
    cont = $(this).contents()
    $(this).replaceWith cont


jQuery.initializer '.modal-body', ->
  div = $('.js-remove-if-modal')
  div.removeClass 'container'
  div.focus()

  #change map on home site if screen is smaller than 356px
change_map_size = ->
  map = $('#map-poland')
  if window.outerWidth < 356
    if map.hasClass('m340')
      map.removeClass 'm340'
      map.addClass 'm240'
  else
    if map.hasClass('m240')
      map.removeClass 'm240'
      map.addClass 'm340'

$(document).ready ->
  change_map_size()

$(window).resize ->
  change_map_size()

# method to skip navigation links
$ ->
  $('.js-skip-navi').click (e) ->
    e.preventDefault()
    x = $('a.js-to-skip-navi:first')

    setTimeout (
      $('html, body').animate { scrollTop: x.offset().top }, 1000
      x.focus()
      console.log(x.get(0))
    ), 150
  return

jQuery.initializer '.redactor_toolbar', ->
  this.find('.redactor_btn_bold').attr('alt', "Pogrubienie")
  this.find('.redactor_btn_italic').attr('alt', "Pochylenie")
  this.find('.redactor_btn_link').attr('alt', "Wstaw link")
  this.find('.redactor_btn_unorderedlist').attr('alt', "Wypunktowanie")