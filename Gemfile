# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'active_link_to', github: 'LoonyBin/active_link_to'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap'
gem 'breadcrumble'
gem 'enum_help'
gem 'font-awesome-rails'
gem 'haml-rails', '~> 2.1'
gem 'jbuilder', '~> 2.11'
gem 'jquery-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 6.4'
gem 'rails', '~> 7.1.2'
gem 'responders'
gem 'sassc-rails'
gem 'simple_form'
gem 'title'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.4'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec-rails'
end

group :lint do
  gem 'haml_lint'
  gem 'rubocop'
  group 'rubocop' do
    gem 'rubocop-performance'
    gem 'rubocop-rails'
    gem 'rubocop-rspec'
  end
end

group :development do
  gem 'guard'
  group 'guard' do
    gem 'guard-annotate', require: false
    gem 'guard-brakeman', require: false
    gem 'guard-bundler', require: false
    gem 'guard-haml_lint', require: false
    gem 'guard-livereload', require: false
    gem 'guard-migrate', require: false
    gem 'guard-process', require: false
    gem 'guard-puma', require: false
    gem 'guard-rspec', require: false
    gem 'guard-rubocop', require: false
  end
  gem 'listen', '>= 3.0.5', '< 3.9'
  gem 'pry-rails'
  gem 'rack-livereload'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.1.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
