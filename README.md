# Lecter

There are a lot of people around developing web apps also as new developers on projects. Sometimes they don't know how app works and which exactly processes work.
That gem will help them to understand which code executes per request.
 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lecter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lecter

## Usage


1. Use multithreading server such like a `puma` with workers more than `1`.
2. Precompile `railscasts.css` and `highlight.pack.js` assets.
3. Add routes in your `routes.rb`

`` `ruby
ruby namespace :lecter do 
  resource :diagnosis, only: %i[show create new], controller: :diagnosis end 
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lecter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
If you want to help please feel free to add new issue.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lecter project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lecter/blob/master/CODE_OF_CONDUCT.md).
