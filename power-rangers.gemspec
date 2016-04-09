# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'power_rangers/version'

Gem::Specification.new do |spec|
    spec.name = 'power-rangers-rb'
    spec.version = PowerRangers::VERSION
    spec.authors = ['Reinier van der Windt']
    spec.email = ['reiniervdwindt@gmail.com']

    spec.summary = %q{A Ruby wrapper for Power Ranger API}
    spec.description = %q{A Ruby wrapper for Power Ranger API}
    spec.homepage = 'https://github.com/reiniervdwindt/power-rangers-rb'
    spec.license = 'MIT'

    spec.files = `git ls-files -z`.split("\x0")
    spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
    spec.require_paths = ['lib']

    spec.add_development_dependency 'bundler', '~> 1.6'
    spec.add_development_dependency 'rake'
    spec.add_development_dependency 'minitest'
    spec.add_development_dependency 'vcr'
    spec.add_development_dependency 'webmock'

    spec.add_dependency 'httpclient'
    spec.add_dependency 'json'
end
