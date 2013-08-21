jQuery ->
  new TypeaheadElement('patients', '.patient-typeahead')
  new TypeaheadElement('medical', '.medical-typeahead')

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
      console.log data
