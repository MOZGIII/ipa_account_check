# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ipa_account_check/version'

Gem::Specification.new do |gem|
  gem.name          = "ipa_account_check"
  gem.version       = IpaAccountCheck::VERSION
  gem.authors       = ["MOZGIII"]
  gem.email         = ["mike-n@narod.ru"]
  gem.description   = %q{Displays AppStore account from .ipa file}
  gem.summary       = %q{Displays AppStore account from .ipa file}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_runtime_dependency "rubyzip", ">= 0.9.9"
end
