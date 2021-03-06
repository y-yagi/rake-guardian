# Rake::Guardian

To prevent the execution of the Rake in a particular environment in Rails application

[![Build Status](https://travis-ci.org/y-yagi/rake-guardian.svg?branch=master)](https://travis-ci.org/y-yagi/rake-guardian)
[![Gem Version](https://badge.fury.io/rb/rake-guardian.svg)](http://badge.fury.io/rb/rake-guardian)
[![Code Climate](https://codeclimate.com/github/y-yagi/rake-guardian/badges/gpa.svg)](https://codeclimate.com/github/y-yagi/rake-guardian)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake-guardian'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake-guardian

## Usage

If you were running the `rake db:drop` in in production environment by mistake, to prevent automatic processing.

```
./bin/rake db:drop RAILS_ENV=production
[rake-guardian] db:drop can not invoke.
```
By default, it will prevent the execution of the `db:drop`, `db:reset`, `db:purge` and `db:drop:all`.
Judgment of environment I have performed in `RAILS_ENV`.

### configuration options

You can configure the following default values by overriding these values using Rake::Guardian.configure method.

```ruby
env     # %w(production)
tasks   # %w(db:drop db:reset db:purge db:drop:all)
```

Example.

```ruby
# config/initializers/rake_guardian.rb
Rake::Guardian.configure do |config|
  config.env = %w(production staging)
  config.tasks = %w(db:drop db:purge db:fixtures:load)
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/y-yagi/rake-guardian. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

