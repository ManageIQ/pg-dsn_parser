# PG::DSNParser

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

