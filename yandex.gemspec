# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yandex/version'

Gem::Specification.new do |spec|
    spec.name = 'yandex-translator-api'
    spec.version = Yandex::VERSION
    spec.authors = ['Anton Bogdanov']
    spec.email = ['kortirso@gmail.com']

    spec.summary = 'Text translating by Yandex Translator API'
    spec.description = 'Gem for sending words for translation to Yandex Translator API'
    spec.homepage = 'https://github.com/kortirso/yandex-translator-api'
    spec.license = 'MIT'

    spec.files = `git ls-files -z`.split("\x0").reject do |f|
        f.match(%r{^(test|spec|features)/})
    end
    spec.bindir = 'exe'
    spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
    spec.require_paths = ['lib']

    spec.add_development_dependency 'bundler', '~> 1.14'
    spec.add_development_dependency 'rake', '~> 10.0'
    spec.add_development_dependency 'rubocop', '~> 0.49.1'
    spec.add_dependency 'httparty', '~> 0.15'
end
