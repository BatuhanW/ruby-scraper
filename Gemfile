source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12'

group :development, :test do
  # Plays well with guard console. Type 'byebug' anywhere to debug.
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Ruby style guide code analyzer
  # https://rubocop.readthedocs.io
  gem 'rubocop', require: false

  # A static analysis security vulnerability scanner for Ruby on Rails applications
  # https://github.com/presidentbeef/brakeman
  gem 'brakeman', require: false

  # Chrome extension for Rails Development
  # https://github.com/dejan/rails_panel/
  gem 'meta_request'

  # Intelligently launch tests when files are modified
  # https://github.com/guard/guard
  gem 'guard'
  # https://github.com/guard/guard-minitest
  gem 'guard-minitest'
  # https://github.com/yujinakayama/guard-rubocop
  gem 'guard-rubocop'
  # https://github.com/guard/guard-brakeman
  gem 'guard-brakeman'
end

group :test do
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Parse HTML stuff
gem 'nokogiri'

# Serialize json
gem 'active_model_serializers', '~> 0.10.0'
