source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'thin'
gem 'haml-rails'
gem 'simple_form'
gem 'activeadmin', github: 'gregbell/active_admin', branch: 'rails4'
# gem 'nokogiri'
# gem 'devise'
# gem 'country_select'
# gem "paperclip", "~> 3.4.1"
# gem "paperclip-aws", "~> 1.6.7"
# gem 'aws-sdk'
gem 'faker'
# gem 'will_paginate'
# gem 'split', :require => 'split/dashboard'
# gem 'sitemap_generator'

group :development do
  gem 'jazz_hands'
  gem 'rb-fsevent', :require => false
  gem 'annotate'
  gem 'quiet_assets'
  gem "nifty-generators"
end

group :test, :development do
  gem 'debugger'
  gem "rspec-rails"
  gem 'factory_girl_rails'
  gem 'debugger'
  gem 'spring', '0.0.9'
  gem 'guard-spring'


  # required to convert devise views to haml
  # https://github.com/plataformatec/devise/wiki/How-To%3a-Create-Haml-and-Slim-Views
  # for i in `find app/views/devise -name '*.erb'` ; do html2haml -e $i ${i%erb}haml ; rm $i ; done
  gem 'ruby_parser'
  gem 'html2haml', :git => "https://github.com/haml/html2haml.git"
end


group :test do
  gem 'capybara'
  gem "capybara-webkit"
  gem 'guard-rspec'
  gem 'database_cleaner'
  gem 'terminal-notifier-guard'
  gem 'valid_attribute'
  gem 'database_cleaner'
  gem 'fuubar'
end

# gem "mocha", :group => :test

