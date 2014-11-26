# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'psd2yaml/version'

Gem::Specification.new do |spec|
  spec.name          = "psd2yaml"
  spec.version       = Psd2yaml::VERSION
  spec.authors       = ["Tessa Thornton"]
  spec.email         = ["tessa.thornton@shopify.com"]
  spec.summary       = %q{Extract text layers from psd files into a yaml file}  
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.executables   = ["psd2yaml"]
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "psd", "~> 3.2"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
