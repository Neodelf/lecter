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

    ```ruby
    namespace :lecter do
      resource :diagnosis, only: %i[show create new], controller: :diagnosis
    end
    ```

4. Go to `/lecter/diagnosis/new` and fill fields:

    `endpoint` - route like `blogs` without slash at the first char
 
    `method` - `get` or `post`
 
    `params` - parameters which will be handled on request. If you use `get` method please add your parameters to `endpoint` (i.e. `blogs?author_name=Andrey`)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neodelf/lecter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lecter project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lecter/blob/master/CODE_OF_CONDUCT.md).
