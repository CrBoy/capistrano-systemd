# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/systemd/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-systemd"
  spec.version       = Capistrano::Systemd::VERSION
  spec.authors       = ["CrBoy"]
  spec.email         = ["crboy@crboy.net"]

  spec.summary       = %q{Systemd operations for capistrano}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/CrBoy/capistrano-systemd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", "~> 3.5"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
