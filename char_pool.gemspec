# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'char_pool/version'

Gem::Specification.new do |spec|
  spec.name          = "char_pool"
  spec.version       = CharPool::VERSION
  spec.authors       = ["Teja Sophista V.R."]
  spec.email         = ["tejanium@yahoo.com"]

  spec.summary       = "Itearte, Encode and Decode your chars set"
  spec.homepage      = "https://github.com/tejanium/char_pool"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
