# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doge_coin/version'

Gem::Specification.new do |spec|
  spec.name          = "doge_coin"
  spec.version       = DogeCoin::VERSION
  spec.authors       = ["Dimitri Jorge"]
  spec.email         = ["jorge.dimitri@gmail.com"]
  spec.summary       = %q{A simple wrapper for dogechain.info api calls}
  spec.description   = %q{This is a wrapper for the dogechain.info api calls. Make verifications on transactions, check amounts received and sent, execute block on a given verification count etc..}
  spec.homepage      = "https://github.com/jorge-d/dogecoin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
