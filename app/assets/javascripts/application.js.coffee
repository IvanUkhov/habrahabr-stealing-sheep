class Application
  constructor: ->
    @application = $('#application')
    @snippets = $('#snippets')

    @configuration = chrome.extension.getBackgroundPage().configuration

    @setBusy(true)
    @configuration.load =>
      @updateSnippets()
      @setBusy(false)

    @snippets.on 'click', 'input', (event) =>
      return false if @isBusy()

      element = $(event.target)
      @configuration.setActive(element.attr('id'), element.prop('checked'))

      return

    $('#update').click (event) =>
      return if @isBusy()

      @setBusy(true)

      @configuration.reload =>
        @updateSnippets()
        @setBusy(false)

        return

      false

  isBusy: ->
    @application.hasClass('busy')

  setBusy: (value) ->
    if value
      @application.addClass('busy')
    else
      @application.removeClass('busy')

    return

  updateSnippets: ->
    @snippets.empty()

    for record in @configuration.records
      checked = @configuration.isActive(record.id)
      @snippets.append @createSnippet(record, checked)

    return

  createSnippet: (record, checked) ->
    label = $('<label></label>').attr(for: record.id)

    checkbox = $('<input>').attr
      id: record.id,
      type: 'checkbox',
      checked: checked

    label.append(checkbox).append(record.description)

    $('<li></li>').append(label)

application = new Application()
