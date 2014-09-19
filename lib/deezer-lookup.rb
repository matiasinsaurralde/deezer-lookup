require 'damerau-levenshtein'
require 'open-uri'
require 'json'

LEVENSHTEIN_THRESHOLDS = { :song => 0, :artist => 0 } # by default don't accept variations

module Deezer

  def self.access_token(token, levenshtein_thresholds = LEVENSHTEIN_THRESHOLDS)
    @access_token, @levenshtein_thresholds = token, levenshtein_thresholds
  end

  def self.levenshtein_thresholds=(thresholds)
    @levenshtein_thresholds = thresholds
  end

  def self.lookup(*query)
    base_url = "http://api.deezer.com/search?access_token=#{@access_token}&q="
    base_url += URI.escape( query.join(' ').downcase )
    raw_json = open(base_url).read()
    data = JSON.parse(raw_json)['data']
  end

end
