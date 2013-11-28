class SitesHasher
  constructor: (@shaFunction) ->
    throw "Need a sha function" unless @shaFunction?

  generate: (sites) ->
    data = for site in sites
      "#{site.url}: #{site.tags.join(', ')}"
    stringifiedData = data.sort().join('|')
    @shaFunction(stringifiedData)

if typeof exports != 'undefined'
  module.exports = SitesHasher
else
  BH.Lib.SitesHasher = SitesHasher
