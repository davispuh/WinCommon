# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'win_common/version'

Gem::Specification.new do |spec|
  spec.name          = 'WinCommon'
  spec.version       = WinCommon::VERSION
  spec.authors       = ['Dāvis']
  spec.email         = ['davispuh@gmail.com']
  spec.summary       = 'Commonly used things when interacting with Windows'
  spec.description   = 'Library for commonly used Windows constants, data types, typedefs, structures and functions.'
  spec.homepage      = 'https://github.com/davispuh/WinCommon'
  spec.license       = 'UNLICENSE'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'yard'
end

