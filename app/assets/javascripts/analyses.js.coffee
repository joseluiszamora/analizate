jQuery ->
  new TypeaheadElement('patients', '.patient-typeahead')
  new TypeaheadElement('medical', '.medical-typeahead')

  $(document).on 'change', '.category-check', ->
    if $('li[data-target="#step3"]').hasClass('active')
      ids = $.map $('#step3').find('input[type=checkbox]:checked'), (value, index) ->
        $(value).val()
      id = $(@).data('analysis-id')
      $.get('/analyses/tests', { id: id, category_ids: ids }, null, 'script')

  $(".timepicker").timepicker
    showMeridian: false

  $(".datepicker").datepicker(format: "dd/mm/yyyy").on "changeDate", (ev) ->
    $(this).datepicker "hide"

  $wizard = $("#fuelux-wizard")
  $btnPrev = $(".wizard-actions .btn-prev")
  $btnNext = $(".wizard-actions .btn-next")
  $btnFinish = $(".wizard-actions .btn-finish")
  $btnPrev.attr "disabled", "disabled"
  $wizard.wizard().on("finished", (e) ->
  ).on "changed", (e) ->
    step = $wizard.wizard("selectedItem")
    $btnNext.removeAttr "disabled"
    $btnPrev.removeAttr "disabled"
    $btnNext.show()
    $btnFinish.hide()
    if step.step is 1
      $btnPrev.attr "disabled", "disabled"
    else if step.step is 4
      $btnNext.hide()
      $btnFinish.show()

  $btnPrev.on "click", ->
    $wizard.wizard "previous"

  $btnNext.on "click", ->
    $wizard.wizard "next"

  #$("input:checkbox, input:radio").uniform()
  $(".select2").select2 placeholder: "Select a State"
  $(".datepicker").datepicker().on "changeDate", (ev) ->
    $(this).datepicker "hide"

  $(".wysihtml5").wysihtml5 "font-styles": false


class TypeaheadElement
  constructor: (name, selector) ->
    @name = name
    @elem = $(selector)
    @url = "#{ $(selector).data('url') }?q=%QUERY"
    @initialize_typeahead()

  initialize_typeahead: =>
    @elem.typeahead
      name: @name
      remote: @url
      template: '<p>{{name}}</p>'
      engine: Hogan
      valueKey: 'name'
    .on 'typeahead:selected', (evt, data) ->
      $(@).parent().next('input[type=hidden]').val(data.id)
