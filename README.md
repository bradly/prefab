# Prefab

A lightweight library for managing resources in your Rails application's controllers

## Introduction

This gem provides a lightweight library that simplifies the controllers of your resources in a Rails application. It offers a set of intuitive and convenient methods for handling common CRUD operations, including creating, reading, updating, and deleting resources.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add prefab

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install prefab

## Usage
Include Prefab::Base in your top-level controller.

```ruby
class ApplicationController < ActionController::Base
  include Prefab::Base
end
```

That will give your other controllers access to the prefab class method. Then you can prefab your specific resources:

```ruby
class PostsController < ApplicationController
  prefab :posts
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bradly/prefab.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
