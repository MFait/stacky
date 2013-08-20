Gem::Specification.new do |gem|
  gem.name = 'stacky'
  gem.version = '0.0.1'
  gem.date    = Date.today.to_s

  gem.homepage = 'https://github.com/mfait/stacky/'
  gem.summary = 'Command line tool to query stack overflow.'
  gem.description = 'Calls stack overflow for a search term and prints the accepted answer.'

  gem.executables = ['stacky']

  gem.files = [
      'bin/stacky',
      'README.md',
      'stacky.gemspec'
  ]

  gem.files += Dir["lib/**/*"]

  gem.add_dependency('nokogiri')
  gem.add_dependency('choice')

  gem.authors = ['Michael Fait']
  gem.email = 'michael.fait@gmail.com'
  gem.license = 'MIT'
end