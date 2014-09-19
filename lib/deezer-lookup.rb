require 'damerau-levenshtein'
require 'open-uri'
require 'json'

LEVENSHTEIN_THRESHOLDS = []

module Deezer
  def self.access_token(token)
    @access_token = token
  end
  def self.lookup(*query)
    base_url = "http://api.deezer.com/search?access_token=#{@access_token}&q="
    base_url += URI.escape( query.join(' ').downcase )
    raw_json = open(base_url).read()
    data = JSON.parse(raw_json)['data']
  end
end
