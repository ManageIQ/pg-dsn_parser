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

  spec.add_development_dependency "bundler",       "~> 1.12"
  spec.add_development_dependency "manageiq-style"
  spec.add_development_dependency "rake",          "~> 10.0"
  spec.add_development_dependency "rspec",         "~> 3.0"
end
