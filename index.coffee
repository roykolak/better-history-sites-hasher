class SitesHasher
  constructor: (@shaFunction) ->

  generate: (sites) ->
    data = for site in sites
      "#{site.url}: #{site.tags.join(', ')}"
    stringifiedData = data.sort().join('|')
    @shaFunction(stringifiedData)

if typeof exports != 'undefined'
  exports.SitesHasher = SitesHasher
else
  BH.Lib.SitesHasher = SitesHasher
