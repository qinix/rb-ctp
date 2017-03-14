# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ctp/version'

Gem::Specification.new do |spec|
  spec.name          = "ctp"
  spec.version       = Ctp::VERSION
  spec.authors       = ["Eric Zhang"]
  spec.email         = ["i@qinix.com"]

  spec.summary       = %q{Ruby support for CTP}
  spec.description   = %q{Ruby support for CTP}
  spec.homepage      = "https://github.com/qinix/rb-ctp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/ctp/extconf.rb"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec", "~> 3.0"
end
