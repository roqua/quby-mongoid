# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quby/mongoid/version'

Gem::Specification.new do |spec|
  spec.name          = "quby-mongoid"
  spec.version       = Quby::Mongoid::VERSION
  spec.authors       = ["Marten Veldthuis"]
  spec.email         = ["marten@veldthuis.com"]
  spec.summary       = %q{Mongoid database adapter for the Quby questionnaire engine}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'quby'
  spec.add_dependency "mongoid", ">= 2.2", '< 5.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'pry'

  # Test dependencies
  spec.add_development_dependency 'rspec', '~> 2.14.0'
  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency 'rubocop', '~> 0.19.0'
end
