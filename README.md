<p align="center">
  <img src="https://github.com/Neodelf/staff/blob/master/lecter_web_with_text.png?raw=true" alt="Lecter Logo" width="866px"/>
</p>

[![Gem Version][0]][1]
[![CircleCI][2]][3]
[![Test Coverage][12]][13]
[![Maintainability][10]][11]

[<img width="200" src="https://github.com/Neodelf/staff/blob/master/evrone-sponsored-logo.png?raw=true" alt="Evrone Logo"/>][14]

## Table of contents
* [:rotating_light: Problems](#rotating_light-problems)
* [:rocket: Solution](#rocket-solution)
* [:loudspeaker: Prerequisites](#loudspeaker-prerequisites)
* [:hammer_and_wrench: Installing](#hammer_and_wrench-installing)
* [:joystick: Using](#joystick-using)
* [:man_technologist: Example of using](#man_technologist-example-of-using)
* [:heart: Contributing](#heart-contributing)
* [:card_file_box: License](#card_file_box-license)

## :rotating_light: Problems
1. Developers **don't know** how their app works.
2. Reading code is a **long** process.
3. Memorize many lines of code is **difficult**.

## :rocket: Solution
The main purpose of that gem is **to help developers to understand which code executes** by request.<br>

Gem's work could be compared with visiting a doctor:
You give symptoms of your disease and **receive a diagnosis**.<br>
You give parameters of a request and **receive executable code**.

You don't have to work with debuggers, read and remember many lines of code.<br>
Just **give&receive**!

## :loudspeaker: Prerequisites
Please **use a multithreading server** such as a [puma][4] with more than `1` workers.<br>
More information about how to tune puma server please follow the [link][5].

## :hammer_and_wrench: Installing
Installing is a **very simple** process.

1. **Add** that gem to your Gemfile:

    ```ruby
    group :development do
      gem 'lecter'
    end
    ```

2. **Execute** in a terminal in app's directory:

    ```zsh
    bundle install
    ```

3. **Precompile** assets<br>
    Add `lecter.css lecter.js` to your `config/initializers/assets.rb` like this:

    ```ruby
    Rails.application.config.assets.precompile += %w(lecter.css lecter.js)
    ```
    More information about it and how to do it please follow the [ruby on rails' guide][6].

4. **Add** routes to your `config/routes.rb`:
    ```ruby
    mount Lecter::Engine => '/lecter'
    ```

## :joystick: Using
You should do **two** simple steps:

1. **Go** to `/lecter/new`

2. **Fill in** form fields with request parameters:

    `endpoint` - use absolute route like `localhost:3000/blogs`<br>
    `params` - request's parameters<br>
    `method` - request's method

## :man_technologist: Example of using
There is an example with **POST** method:

1. **Go** to `localhost:3000`

2. **Fill** form with:

    `endpoint` - `localhost:3000/posts`<br>
    `params` - `"post"=>{"title"=>"New title", "description"=>"Desciption"}`<br>
    `method` - `POST`

    <img src="https://raw.githubusercontent.com/Neodelf/staff/master/lecter_post_12_04.png" alt="lecter example post form" title="Example Lecter POST request form" height="350px" />

3. **Submit** form
4. **Receive** result

    <img src="https://raw.githubusercontent.com/Neodelf/staff/master/lecter_post_result_12_04.png" alt="lecter post form result" title="Example Lecter POST request result"/>

## :heart: Contributing
1. Bug reports and pull requests **are welcome**.
2. There are many issues as a proposal to improve this library. If you have any ideas please **feel free** to write your thoughts in a [new issue][7].
3. Choose **what you like** to fix or improve on the [issues list][8]. You can ask any questions in the comments.
4. :bangbang: **Mention of each contributor** will be on the README file.

## :card_file_box: License
The gem is available as open source under the terms of the [MIT License][9].

[0]: https://badge.fury.io/rb/lecter.svg
[1]: https://badge.fury.io/rb/lecter
[2]: https://circleci.com/gh/Neodelf/lecter.svg?style=shield
[3]: https://circleci.com/gh/neodelf/lecter
[4]: https://github.com/puma/puma
[5]: https://github.com/puma/puma#clustered-mode
[6]: https://guides.rubyonrails.org/asset_pipeline.html#precompiling-assets
[7]: https://github.com/Neodelf/lecter/issues/new
[8]: https://github.com/Neodelf/lecter/issues
[9]: https://opensource.org/licenses/MIT
[10]: https://api.codeclimate.com/v1/badges/45d57f439d66990490f1/maintainability
[11]: https://codeclimate.com/github/Neodelf/lecter/maintainability
[12]: https://api.codeclimate.com/v1/badges/45d57f439d66990490f1/test_coverage
[13]: https://codeclimate.com/github/Neodelf/lecter/test_coverage
[14]: https://evrone.com
