# RateLimit

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/rate_limit`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rate_limit', git: 'https://github.com/upscopeio/rate_limit'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rate_limit

## Usage

RateLimit adds a controller class method `rate_limit`, you can add it to the `ApplicationController`, like the example below:

```ruby
class ApplicationController < ActionController::Base
  rate_limit 200, every: 1.minute
end
```

#### Notifier
Implement your own notifier logic by subscribing to the `rate_limit.notifier` event

```ruby
ActionSupport::Notifications.subscribe 'rate_limit.notifier' do |_name, _start, _finish, _id, payload|
  # Your Notifier logic goes here
  # The payload param will return the rate_limit_key
  # e.g ( payload => { rate_limit_key: 'controller_throttle:auth/session:10:900:127.0.0.1' } )
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/upscopeio/rate_limit.
