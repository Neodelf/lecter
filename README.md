<p align="center">
  <img src="https://github.com/Neodelf/staff/blob/master/lecter_web_with_text.png?raw=true" alt="Lecter Logo" width="866px"/>
</p>

[![Gem Version](https://badge.fury.io/rb/lecter.svg)](https://badge.fury.io/rb/lecter)

## Table of contents
* [:rotating_light: Problems](#problem)
* [:rocket: Solution](#solution)
* [:loudspeaker: Prerequisites](#prerequisites)
* [:hammer_and_wrench: Installing](#installing)
* [:joystick: Using](#using)
* [:man_technologist: Examples of using](#examples_of_using)
* [:heart: Contributing](#contributing)
* [:card_file_box: License](#license)

## :rotating_light: Problems
1. Developers **don't know** how their app works.
2. Reading code is a **long process**.
3. Memorize many lines of code is **difficult**.

## :rocket: Solution
The main purpose of that gem is **to help developers to understand which code executes** by request.<br>
Gem's work can been compared with visiting a doctor.

**You give sympthomes** of your disease and **receive diagnosis**.<br>
**You give parameters** of request and **receive executable code**. 

You don't have to work with debuggers, read and remember many lines of code.<br>
Just **give&receive**!

## :loudspeaker: Prerequisites
Please **use multithreading server** such like a [puma](https://github.com/puma/puma) with workers more than `1`.<br>
More information about how to tune puma server please follow the [link](https://github.com/puma/puma#clustered-mode).

## :hammer_and_wrench: Installing
Installing is **a very simple process**.

1. **Add** that gem to your Gemfile:

    ```ruby
    group :development do
      gem 'lecter'
    end
    ```

2. **Execute** in terminal in app's directory:

    ```zsh
    ➜  app_name ✗ bundle
    ```

3. **Precompile** `lecter.css lecter.js` assets.<br>
    More information about it and how to do it please follow the [ruby on rails' guide](https://guides.rubyonrails.org/asset_pipeline.html#precompiling-assets).

4. **Add** routes to your `config/routes.rb`:
    ```ruby
    mount Lecter::Engine => '/lecter'
    ```

## :joystick: Using
You should do two **simple steps**:

1. **Go** to `/lecter/diagnosis/new`

2. **Fill** form's fields with request's parameters:

    `endpoint` - use absolute route like `localhost:3000/blogs`<br>
    `params` - request's parameters<br>
    `method` - request's method

## :man_technologist: Examples of using
There are two examples with different request's method. For example, you want to investigate request which is
 
1. `POST` method:

    `endpoint` - `localhost:3000/posts`<br>
    `params` - `"post"=>{"title"=>"New title", "description"=>"Desciption"}`<br>
    `method` - `POST`

    <p align="center">
        <img src="https://raw.githubusercontent.com/neodelf/staff/master/lecter_post_new.png" alt="lecter_post_new" width="866px"/>
    </p>

    After submitting you will receive something like this:

    <p align="center">
    <img src="https://raw.githubusercontent.com/neodelf/staff/master/lecter_post_show.png" alt="lecter_post_show" width="866px"/>
    </p>

2. `GET` method:

    `endpoint` - `localhost:3000/posts`<br>
    `params` - empty field<br>
    `method` - `GET`

    <p align="center">
    <img src="https://raw.githubusercontent.com/neodelf/staff/master/lecter_get_new.png" alt="lecter_get_new" width="866px"/>
    </p>

    After submitting you will receive something like this:

    <p align="center">
    <img src="https://raw.githubusercontent.com/neodelf/staff/master/lecter_get_show.png" alt="lecter_get_show" width="866px"/>
    </p>

## :heart: Contributing
1. Bug reports and pull requests **are welcome**.
2. There are many issues as a proposal to improve this library. If you have any ideas please **feel free** to write your thoughts in [new issue](https://github.com/Neodelf/lecter/issues/new).
3. Choose **what you like** to fix or improve on the [issues list](https://github.com/Neodelf/lecter/issues). You can ask any questions in the comments.
4. :bangbang: **Mention of each contributor** will be on README file. 

## :card_file_box: License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
