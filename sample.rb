require 'deezer-lookup'
require 'pp'

Deezer.access_token 'xxx' # get your token from developers.deezer.com, api explorer

Deezer.levenshtein_thresholds = { :song => 3, :artist => 5 } # overriding the default thresholds
pp Deezer.lookup( 'song 2', 'blur' )

Deezer.levenshtein_thresholds = nil # this would disable levenshtein distance comp.
pp Deezer.lookup( 'riptide', 'vance joy' )

