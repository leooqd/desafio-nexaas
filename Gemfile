source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

gem 'ransack'
gem 'active_model_serializers', '~> 0.10.2'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'faker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  gem "pry-rails"
  gem "pry-byebug"
  gem "better_errors"
  gem 'rubocop', require: false
  
  # tests stuff
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
