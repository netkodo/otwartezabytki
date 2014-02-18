jQuery.initializer 'section.edit.links', ->
  $section = $(this)

  next_id = parseInt($('.sortable').children('li').length)+1
  $section.on 'click', '.add_link', ->
    template = $($(this).data('template'))
    html = template.html()
    html = html.replace(/\[\d+\]/g, "[#{next_id}]")
    html = html.replace(/_\d+_/g, "_#{next_id}_")
    $(html).appendTo(template.parent())
    $section.find('.link-position').each (index) ->
      $(this).val(index + 1)
    template.parents('.links_container:first').show()
    next_id += 1
    $('.fancybox-overlay').height($(document).height())
    false

  $section.on 'click', '.remove_link', ->
    if confirm("Czy na pewno?")
      $(this).parents('.link:first').hide()
      $(this).parents('.link:first').find('input[name*="_destroy"]').val("1")
      if $(this).parents('.links_container:first').find('.link:visible').length == 0
        $(this).parents('.links_container:first').hide()
      $sortable.refresh()
    false

  $sortable = $section.find('ol.sortable').sortable
    axis: 'y'
    update: ->
      $section.find('.link-position').each (index) ->
        $(this).val(index + 1)
  .data('sortable')

  $(this).on 'click', '.save_item', (event) ->
    required = []
    $('.required').children().children().each ->
      if $(this).val() == ""
        required.push($(this)) 
      else if $(this).attr("id").split("_").last() == "date"
        required.push($(this)) if typeof(parseInt($(this).val())) != "number" || $(this).val().length < 4
    if required.length > 0
      event.preventDefault() 
      required.each (element, index) ->
        element.css('border-color', 'red')
        element.attr('placeholder', 'pole nie może być puste')
