#= require configuration

window.configuration = new Configuration()

configuration.load ->
  chrome.tabs.onUpdated.addListener (tabId, changedInfo, tab) ->
    for record in configuration.records
      continue unless tab.url.indexOf(record.pattern) > -1

      if configuration.isActive(record.id)
        chrome.pageAction.show(tabId)
        chrome.tabs.insertCSS(tabId, code: record.styles)
      else
        chrome.pageAction.hide(tabId)

      return
