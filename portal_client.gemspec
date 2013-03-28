# -*- encoding: utf-8 -*-
require File.expand_path('../lib/portal_client/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Darby Frey"]
  gem.email         = ["darby@starterleague.com"]
  gem.description   = %q{Ruby client library for the Starter League Portal API}
  gem.summary       = %q{Ruby client library for the Starter League Portal API}

  gem.add_dependency "oauth2"
  gem.add_dependency "hashie"
  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "portal_client"
  gem.require_paths = ["lib"]
  gem.version       = PortalClient::VERSION
end
