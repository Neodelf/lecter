# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lecter/version'

Gem::Specification.new do |spec|
  spec.name          = 'lecter'
  spec.version       = Lecter::VERSION
  spec.authors       = ['Neodelf']
  spec.email         = ['neodelf@gmail.com']

  spec.summary       = 'Show executable code by request.'
  spec.description   = 'The main purpose of that gem is helping developers to understand which '\
                       'code executes by request.<br>'
  spec.homepage      = 'https://github.com/neodelf/lecter'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'

  spec.add_runtime_dependency 'http'
  spec.add_runtime_dependency 'simplecov', '0.17.1'
end
