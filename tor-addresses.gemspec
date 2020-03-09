
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tor/addresses/version'

Gem::Specification.new do |spec|
  spec.name          = 'tor-addresses'
  spec.version       = Tor::Addresses::VERSION
  spec.authors       = ['dsantosmerino']
  spec.email         = 'dev@badiapp.com'

  spec.summary       = 'This is a Ruby gem for interacting with Tor exit addresses.'
  spec.description   = "You'll be able to find all the existing exit nodes, retrieving the nodes from https://check.torproject.org/exit-addresses."
  spec.homepage      = 'https://github.com/Badiapp/tor-addresses-gem'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 4.0'
end
