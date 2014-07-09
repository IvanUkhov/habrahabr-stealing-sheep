class Storage
  constructor: ->
    @parameters = {}

  load: (callback) ->
    chrome.storage.local.get null, (parameters) =>
      @parameters = parameters
      callback(@)

  get: (id, value) ->
    if @parameters.hasOwnProperty(id) then @parameters[id] else value

  set: (id, value) ->
    @parameters[id] = value
    chrome.storage.local.set(@parameters)

window.Storage = Storage
