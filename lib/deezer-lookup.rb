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

    results, input_song_title, input_artist_name, filtered_results = JSON.parse(raw_json)['data'], query[0].downcase, query[1].downcase, []

    results.each do |r|
      song_title, artist_name = r['title'].downcase, r['artist']['name'].downcase
      r['levenshtein'] = [ DamerauLevenshtein.distance(song_title, input_song_title), DamerauLevenshtein.distance(artist_name, input_artist_name) ]
    end

    results.each do |r|
      song_title, artist_name = r['title'].downcase, r['artist']['name'].downcase
      if r['levenshtein'][0] <= @levenshtein_thresholds[:song] and r['levenshtein'][1] <= @levenshtein_thresholds[:artist]
        filtered_results.push(r)
      end
    end

    filtered_results

  end

end
