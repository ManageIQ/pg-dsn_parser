# PG::DSNParser

[![Gem Version](https://badge.fury.io/rb/pg-dsn_parser.svg)](http://badge.fury.io/rb/pg-dsn_parser)
[![CI](https://github.com/ManageIQ/pg-dsn_parser/actions/workflows/ci.yaml/badge.svg)](https://github.com/ManageIQ/pg-dsn_parser/actions/workflows/ci.yaml)
[![Code Climate](https://codeclimate.com/github/ManageIQ/pg-dsn_parser.svg)](https://codeclimate.com/github/ManageIQ/pg-dsn_parser)
[![Test Coverage](https://codeclimate.com/github/ManageIQ/pg-dsn_parser/badges/coverage.svg)](https://codeclimate.com/github/ManageIQ/pg-dsn_parser/coverage)

A parser for PostgreSQL DSNs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pg-dsn_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pg-dsn_parser

## Usage

```ruby
require 'pg/dsn_parser'

parser = PG::DSNParser.new

parser.parse("host=localhost user=username dbname='postgres' port = 5432")
# => {:host=>"localhost", :user=>"username", :dbname=>"postgres", :port=>"5432"}
```

## License

The gem is available as open source under the terms of the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ManageIQ/pg-dsn_parser.

