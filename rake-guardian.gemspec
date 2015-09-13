# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake/guardian/version'

Gem::Specification.new do |spec|
  spec.name          = "rake-guardian"
  spec.version       = Rake::Guardian::VERSION
  spec.authors       = ["Yuji Yaginuma"]
  spec.email         = ["yuuji.yaginuma@gmail.com"]

  spec.summary       = %q{Guard the Rake of execution in a particular environment}
  spec.description   = %q{Guard the Rake of execution in a particular environment}
  spec.homepage      = "https://github.com/y-yagi/rake-guardian"
  spec.license       = "MIT"

  spec.metadata['allowed_push_host'] = "https://rubygems.org"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency "activesupport"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "minitest"
end
