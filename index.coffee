class SitesHasher
  constructor: (@shaFunction, @scope = null) ->
    throw "Need a sha function" unless @shaFunction?

  generate: (sites) ->
    data = for site in sites
      "#{site.url}: #{site.tags.sort().join(', ')}"
    stringifiedData = data.sort().join('|')

    @shaFunction.apply @scope, [stringifiedData]

if typeof exports != 'undefined'
  module.exports = SitesHasher
else
  BH.Lib.SitesHasher = SitesHasher
