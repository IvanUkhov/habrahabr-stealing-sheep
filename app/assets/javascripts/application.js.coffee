records = [
  { pattern: 'habrahabr\.ru', selector: 'h1' }
]

rules = []

for record in records
  rules.push \
    matcher: new RegExp(record.pattern),
    content: "#{ record.selector } { letter-spacing: normal !important; }"

chrome.tabs.onUpdated.addListener (tabId, changedInfo, tab) ->

  return unless changedInfo.status is 'complete'

  for rule in rules
    continue unless rule.matcher.exec(tab.url)
    chrome.tabs.insertCSS(tabId, code: rule.content)
    chrome.pageAction.show(tabId)
    return

  chrome.pageAction.hide(tabId)
