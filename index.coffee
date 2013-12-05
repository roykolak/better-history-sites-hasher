class SitesHasher
  constructor: (@shaFunction, @scope = null) ->
    throw "Need a sha function" unless @shaFunction?

  generate: (sites) ->
    data = []
    for site in sites
      if site.tags.length > 0
        compiledString = "#{site.url}: #{site.tags.sort().join(', ')}"
        data.push compiledString
    stringifiedData = data.sort().join('|')

    if data.length == 0
      ""
    else
      @shaFunction.apply @scope, [stringifiedData]

if typeof exports != 'undefined'
  module.exports = SitesHasher
else
  BH.Lib.SitesHasher = SitesHasher
