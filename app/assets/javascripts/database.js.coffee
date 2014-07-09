class Database
  constructor: ->
    AWS.config.update
      region: 'us-west-2',
      accessKeyId: 'AKIAIWDQD4EBC33YVQVA',
      secretAccessKey: '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'

    @connection = new AWS.DynamoDB()

  load: (callback) ->
    if @records
      callback(@records)
      return

    @connection.scan { TableName: 'StopStealingSheep' }, (error, data) =>
      return if error

      @records = []

      for item in data.Items
        @records.push
          id: item.id.S,
          description: item.description.S,
          pattern: item.pattern.S,
          styles: item.styles.S

      callback(@records)

      return

    return

window.Database = Database
