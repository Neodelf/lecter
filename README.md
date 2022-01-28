<p align="center">
  <img src="https://github.com/Neodelf/staff/blob/master/lecter_web_with_text.png?raw=true" alt="Lecter Logo" width="866px"/>
</p>

[![Gem Version][0]][1]
[![Ruby Style Guide][15]][16]
[![CircleCI][2]][3]
[![Test Coverage][12]][13]
[![Maintainability][10]][11]
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)

[<img width="200" src="https://github.com/Neodelf/staff/blob/master/evrone-sponsored-logo.png?raw=true" alt="Evrone Logo"/>][14]

## Table of contents
* [:rotating_light: Problems](#rotating_light-problems)
* [:rocket: Solutions](#rocket-solution)
* [:bangbang: Requirements](#bangbang-requirements)
* [:hammer_and_wrench: Installation](#hammer_and_wrench-installing)
* [:joystick: Usage](#joystick-using)
* [:man_technologist: Examples](#man_technologist-example-of-using)
* [:heart: Contributing & Contributors](#heart-contributing--contributors)
* [:card_file_box: License](#card_file_box-license)

## :rotating_light: Problems
1. Developers **don't know** how their app works.
2. Reading code is a **long** process.
3. Memorizing many lines of code is **difficult**.

## :rocket: Solutions
1. The main purpose of this gem is **to help developers understand which code is executed** by a request.<br>

2. Gem's purpose could be compared to visiting a doctor:
You give the symptoms of your disease and **receive a diagnosis**.<br>
You give the parameters of a request and **receive executable code**.

3. You don't have to work with debuggers, read and remember many lines of code.<br>
Just **give & receive**!

## :bangbang: Requirements
Please **use a multithreading server** such as a [puma][4] server with more than `1` worker.<br>
For more information about how to tune a puma server, please visit this [link][5].

## :hammer_and_wrench: Installation
Installing is a **very simple** process.

1. **Add** the gem to your Gemfile:

    ```ruby
    group :development do
      gem 'lecter', github: 'neodelf/lecter'
    end
    ```

2. **Execute** in a terminal in your app's directory:

    ```zsh
    bundle install
    ```

3. **Add** routes to your `config/routes.rb`:
    ```ruby
    mount Lecter::Engine => '/lecter'
    ```

## :joystick: Usage
Follow **two** simple steps:

1. **Go** to `/lecter/diagnosis/new`

2. **Fill in** the form fields with request parameters:

    `HTTP method` - request's method<br>
    `Endpoint` - use absolute route like `localhost:3000/blogs`<br>
    `Body(raw)` - request's parameters

## :man_technologist: Examples
Here is an example with a **POST** request:

1. **Go** to `localhost:3000/lecter/diagnosis/new`

2. **Fill** in the form with:

    `HTTP method` - `POST`<br>
    `Endpoint` - `localhost:3000/posts`<br>
    `Body(raw)` - `"post"=>{"title"=>"New title", "description"=>"Desciption"}`

    <img src="https://raw.githubusercontent.com/Neodelf/staff/master/lecter-post-form.png" alt="lecter example post form" title="Example Lecter POST request form" height="350px" />

3. **Submit** the form
4. **Review** the result

    <img src="https://raw.githubusercontent.com/Neodelf/staff/master/lecter-post-result.png" alt="lecter post form result" title="Example Lecter POST request result"/>

## :heart: Contributing & Contributors
1. Bug reports and pull requests **are welcome**.
2. There are many issues as a proposal to improve this library. If you have any ideas, please **feel free** to write your thoughts in a [new issue][7].
3. Choose **what you like** to fix or improve on the [issues list][8]. You can ask any questions in the comments.
4. :bangbang: **Mention of each contributor** will be on the README file.

**Thanks** goes to these wonderful people:

<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/pineapplethief">
        <img src="https://avatars1.githubusercontent.com/u/4012690?v=4" width="100px;" alt=""/>
        <br />
        <sub><b>Aleksey Glukhov</b></sub>
      </a>
      <br />
      <a href="https://github.com/Neodelf/lecter/commits?author=pineapplethief" title="Code">💻</a>
      <a href="https://github.com/Neodelf/lecter/commits?author=pineapplethief" title="Documentation">📖</a>
    </td>
    <td align="center">
      <a href="https://github.com/atayl16">
        <img src="https://avatars.githubusercontent.com/u/24377351?v=4" width="100px;" alt=""/>
        <br />
        <sub><b>Alisha Taylor</b></sub>
      </a>
      <br />
      <a href="https://github.com/Neodelf/lecter/commits?author=atayl16" title="Documentation">📖</a>
    </td>
  </tr>
</table>
<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->

## :card_file_box: License
The gem is available as open source under the terms of the [MIT License][9].

[0]: https://badge.fury.io/rb/lecter.svg
[1]: https://badge.fury.io/rb/lecter
[2]: https://circleci.com/gh/Neodelf/lecter.svg?style=shield
[3]: https://circleci.com/gh/neodelf/lecter
[4]: https://github.com/puma/puma
[5]: https://github.com/puma/puma#clustered-mode
[7]: https://github.com/Neodelf/lecter/issues/new
[8]: https://github.com/Neodelf/lecter/issues
[9]: https://opensource.org/licenses/MIT
[10]: https://api.codeclimate.com/v1/badges/45d57f439d66990490f1/maintainability
[11]: https://codeclimate.com/github/Neodelf/lecter/maintainability
[12]: https://api.codeclimate.com/v1/badges/45d57f439d66990490f1/test_coverage
[13]: https://codeclimate.com/github/Neodelf/lecter/test_coverage
[14]: https://evrone.com
[15]: https://img.shields.io/badge/code_style-rubocop-brightgreen.svg
[16]: https://rubystyle.guide

