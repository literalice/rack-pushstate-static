# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/pushstate_static/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-pushstate-static'
  spec.version       = Rack::PushstateStatic::VERSION
  spec.authors       = ['literalice']
  spec.email         = ['literalice@monochromeroad.com']

  spec.summary       = 'A simple middleware for move state via html5 api.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/literalice/rack-pushstate-static'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'rack-test'
end
