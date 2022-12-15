lib = File.expand_path('lib', __dir__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'jdbc/pgsql/version'

Gem::Specification.new do |spec|
  spec.name          = 'jdbc-pgsql'
  spec.version       = Jdbc::Pgsql::VERSION
  spec.authors       = ['Jesse Chavez']
  spec.email         = ['jesse.chavez.r@gmail.com']

  spec.summary       = 'JDBC driver for JRuby and PostgreSQL'
  spec.description   = "Loads the PostgreSQL JDBC driver. Install this gem and require 'jdbc/pgsql' within JRuby"
  spec.homepage      = 'https://github.com/JesseChavez/jdbc-pgsql'
  spec.license       = 'MIT'
  spec.platform      = 'java'

  spec.files         = ['README.md', 'LICENSE', *Dir['lib/**/*'].to_a]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
