# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easyhttp/version'

Gem::Specification.new do |gem|
  gem.name          = "easyhttp"
  gem.version       = Easyhttp::VERSION
  gem.authors       = "Srinivas Prabhu Ramanna"
  gem.email         = "Srinivas.prabhur@gmail.com"
  gem.description   = "This is a wrapper around ruby http lib"
  gem.summary       = "Hides the complexity and provides a simple interface to interact with ruby http class"
  gem.homepage      = ""
  gem.files = %w(easyhttp.gemspec)
  gem.files += Dir.glob("lib/**/*.rb")
  gem.files += Dir.glob("lib/**/*.yaml")
#  gem.license = 'MIT'
  gem.licenses = ['MIT', 'GPL-2']
end
