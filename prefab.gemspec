# frozen_string_literal: true

require_relative "lib/prefab/version"

Gem::Specification.new do |spec|
  spec.name = "prefab"
  spec.version = Prefab::VERSION
  spec.authors = ["Bradly Feeley"]
  spec.email = ["4227+bradly@users.noreply.github.com"]

  spec.summary = "A lightweight library for managing resources in your Rails application's controllers"
  spec.description = "This gem provides a lightweight library that simplifies the controllers of your resources in a Rails application. It offers a set of intuitive and convenient methods for handling common CRUD operations, including creating, reading, updating, and deleting resources."
  spec.homepage = "https://github.com/bradly/prefab"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_dependency 'railties'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'actionpack'
  spec.add_development_dependency 'rspec-rails'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
