Gem::Specification.new do |g|
  g.name = 'deezer-lookup'
  g.version = '1.1'
  g.summary = 'This gem allows you to lookup song/artist info using Deezer API (it uses levenshtein for better matching, the thresholds are configurable).'
  g.homepage = 'https://github.com/matiasinsaurralde/deezer-lookup'
  g.description = 'Deezer is a web-based music streaming service. This gem allows you to lookup song/artist info using Deezer API (it uses levenshtein for better matching, the thresholds are configurable).'
  g.author = 'Matias Insaurralde'
  g.email = 'matias@insaurral.de'
  g.files = ['sample.rb'] + Dir['lib/*']
  g.add_runtime_dependency 'damerau-levenshtein', '~> 1.0'
  g.license = 'MIT'
end
