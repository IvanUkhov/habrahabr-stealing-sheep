#= require database
#= require storage

class Configuration
  constructor: ->
    @storage = new Storage()

  load: (callback) ->
    @storage.load (storage) =>
      @active = storage.get('active') || {}
      @records = storage.get('records')

      if @records?
        callback()
      else
        @reload => callback()

      return

    return

  reload: (callback) ->
    database = new Database()
    database.load (records) =>
      @storage.set('records', records)
      @records = records
      callback()

    return

  isActive: (id) ->
    if @active[id] == undefined then true else @active[id]

  setActive: (id, value) ->
    @active[id] = value
    @storage.set('active', @active)

    return

window.Configuration = Configuration
