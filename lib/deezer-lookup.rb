require 'damerau-levenshtein'
require 'open-uri'

module Deezer
  def self.access_token(token)
    @access_token = token
  end
  def self.lookup(*query)
    base_url = "http://api.deezer.com/search?access_token=#{@access_token}&q="
    # http://api.deezer.com/search?q=#{URI.escape(_params)}&access_token=nypmrN5hry5408738ae132endQ8sQed5408738ae1369wgcn7g
    base_url += URI.escape( query.join(' ').downcase )
    raw_html = open(base_url).read()
    
  end
end
