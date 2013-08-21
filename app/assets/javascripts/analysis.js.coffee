jQuery ->
  $typeahead = $('.patient-typeahead').typeahead
    name: 'patients'
    remote: '/patients.json?q=%QUERY'
    template: '<p>{{name}}</p>'
    engine: Hogan
    valueKey: 'name'

  $typeahead.on 'typeahead:selected', (evt, data) ->
    console.log data
