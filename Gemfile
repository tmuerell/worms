source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'mysql2'
end

gem 'jquery-rails'
gem 'rvm-capistrano'
gem 'capistrano'
gem 'formtastic'

# Authentication with devise
gem 'devise'
gem 'therubyracer'

group :development, :test do
  gem "rspec-rails"
  gem "pry"
end

group :test do  
  gem "mocha"
  gem "factory_girl_rails"  
  gem "capybara"  
  gem "timecop"
  gem "growl_notify"
  gem "guard-rspec"
end