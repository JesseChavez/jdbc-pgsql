# Jdbc::Pgsql

This Ruby gem loads the PostgreSQL JDBC driver.
Install this gem and `require 'jdbc/pgsql'` within JRuby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jdbc-pgsql'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jdbc-pgsql

## Usage

This is a very minimal and basic sample.

```ruby
require 'jdbc/pgsql'

url = 'jdbc:postgresql://localhost:5432/sample_database'

other_props = [
  'user=dev_user',
  'password=user_password'
].join('&')

connection = java.sql.DriverManager.getConnection(url + '?' + other_props)

statement = connection.createStatement

sql_query = 'SELECT * FROM users'

result = statement.executeQuery(sql_query)

while result.next
  puts [result.getString(1), result.getString(2), result.getString(3)]
end
```

For more details follow PostgreSQL Jdbc documentation and JRuby conventions to call java methods.

## Supported Java versions

For supported Java version use Gem versions as per below table:

| Java version | Gem version   | used driver |
| ------------ | ------------- | ----------- |
| 8            | 0.1.0         | 42.2.5      |
| 11           | 0.1.0         | 42.2.5      |

## Other Java versions

For other Java version use Gem versions as per below table:

| Java version | Gem version   | used driver |
| ------------ | ------------- | ----------- |
| 9            | 0.1.0         | 42.2.5      |
| 10           | 0.1.0         | 42.2.5      |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jdbc-pgsql. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jdbc::Pgsql project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jdbc-pgsql/blob/master/CODE_OF_CONDUCT.md).
