source ENV.fetch('GEM_SOURCE', 'https://rubygems.org')

ruby '2.1.5'

gem 'dotenv'
gem 'foreman'
gem 'rainbows'

gem 'newrelic_rpm'

gem 'sinatra'
gem 'activerecord'
gem "sinatra-activerecord"

gem 'dragonfly'
gem 'dragonfly-activerecord'

gem 'rake'

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem 'guard-rspec'
  gem 'database_cleaner'
end

group :development do
  gem 'sqlite3'
  gem 'pry'
  gem 'pry-nav'
end

group :production do
  gem 'pg'
end
