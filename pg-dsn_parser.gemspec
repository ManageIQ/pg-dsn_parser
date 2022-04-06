# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pg/dsn_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "pg-dsn_parser"
  spec.version       = PG::DSNParser::VERSION
  spec.authors       = ["Nick Carboni"]
  spec.email         = ["ncarboni@redhat.com"]

  spec.summary       = %q{A parser for PostgreSQL DSNs}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/ManageIQ/pg-dsn_parser"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.5.8'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "manageiq-style"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec",         "~> 3.0"
  spec.add_development_dependency "simplecov",     ">= 0.21.2"
end
