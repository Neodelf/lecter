 <p align="center">
  <img src="https://github.com/Neodelf/staff/blob/master/lecter_web_with_text.png?raw=true" alt="Lecter Logo" width="866px"/>
</p>

There are a lot of people around developing web apps also as new developers on projects. Sometimes they don't know how app works and which exactly processes work.
That gem will help them to understand which code executes per request.
 

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'lecter', git: 'https://github.com/neodelf/lecter'
end
```

And then execute:

    $ bundle

## Usage


1. Use multithreading server such like a `puma` with workers more than `1`.
2. Precompile `lecter.css lecter.js` assets.
3. Add routes in your `routes.rb`

    ```ruby
    mount Lecter::Engine => '/lecter'
    ```

4. Go to `/lecter/diagnosis/new` and fill fields:

    `endpoint` - use absolute route like `localhost:3000/blogs`
 
    `params` - parameters which will be handled on request
 
    `method` - choose one variant

Examples to use
 1. `POST` method:
 
    `endpoint` - `localhost:3000/posts`
    
    `params` - `"post"=>{"title"=>"New title", "description"=>"Desciption"}`
    
    `method` - `POST`

  <p align="center">
   <img src="https://raw.githubusercontent.com/neodelf/staff/master/lecter_post_new.png" alt="lecter_post_new" width="866px"/>
  </p>

 
  After submitting you will receive something like this:

  <p align="center">
   <img src="https://raw.githubusercontent.com/neodelf/staff/master/lecter_post_show.png" alt="lecter_post_show" width="866px"/>
  </p>

 2. `GET` method:
 
    `endpoint` - `localhost:3000/posts`

    `params` - empty field

    `method` - `GET`

  <p align="center">
   <img src="https://raw.githubusercontent.com/neodelf/staff/master/lecter_get_new.png" alt="lecter_get_new" width="866px"/>
  </p>
 
  After submitting you will receive something like this:
 
  <p align="center">
   <img src="https://raw.githubusercontent.com/neodelf/staff/master/lecter_get_show.png" alt="lecter_get_show" width="866px"/>
  </p>
 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neodelf/lecter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lecter project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lecter/blob/master/CODE_OF_CONDUCT.md).
