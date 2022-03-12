# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bootstrap',       '~> 5.1.3'
gem 'dry-struct',      '~> 1.4'
gem 'fakeredis',       '~> 0.8.0'
gem 'faraday',         '~> 2.2'
gem 'puma',            '~> 5.0'
gem 'rails',           '~> 7.0.2', '>= 7.0.2.3'

group :development, :test do
  gem 'byebug',      '~> 11.1.3'
  gem 'pry-byebug',  '~> 3.9'
  gem 'pry-rails',   '~> 0.3.9'
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'lazy_names',    '= 0.1.1'
  gem 'rubocop-rails', '~> 2.3.2', require: false
  gem 'spring',        '~> 4.0'
end
