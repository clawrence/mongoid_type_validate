# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid_type_validate/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid_type_validate"
  spec.version       = MongoidTypeValidate::VERSION
  spec.authors       = ["Craig.Lawrence"]
  spec.email         = ["craig.lawrence@ericsson.com"]
  spec.summary       = "Provide Field Type Validation for Mongoid3."
  spec.description   = "Allow Rails validation to return field type errors for Mongoid 3"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
