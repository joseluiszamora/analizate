check_user_exist = ->
  if $('#analysis_patient_type_selector').is(':checked')
    $('#analysis_patient_id_chosen').hide()
    $('#analysis_patient_name').show()
  else
    $('#analysis_patient_id_chosen').show()
    $('#analysis_patient_name').hide()

jQuery ->

  check_user_exist()

  #$(".select2").select2 placeholder: "Select a State"

  #$(".wysihtml5").wysihtml5 "font-styles": false


  $(document).on 'change', '.category-check', ->
    if $('li[data-target="#step2"]').hasClass('active')
      ids = $.map $('#step2').find('input[type=checkbox]:checked'), (value, index) ->
        $(value).val()
      id = $(@).data('analysis-id')
      $.get('/analyses/tests', { id: id, category_ids: ids }, null, 'script')

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
    else if step.step is 3
      $btnNext.hide()
      $btnFinish.show()

  $btnPrev.on "click", ->
    $wizard.wizard "previous"

  $btnNext.on "click", ->
    $wizard.wizard "next"

  $(document).on 'change', '.show-patient-name', (evt) ->
    $('#analysis_patient_id_chosen').toggle()
    $('#analysis_patient_name').toggle()
