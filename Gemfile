source 'https://rubygems.org'

# decrease puma workers to free up ram for heroku
gem "puma_worker_killer"

gem 'twitter_cldr'

gem 'globalize', git: 'https://github.com/globalize/globalize'
gem 'activemodel-serializers-xml'
#used for javascript time processing
gem 'momentjs-rails'

#Used for pagination
gem 'kaminari'

#Use for finding distance in postgres database
gem 'geocoder'

#use for trie algorithm for effective autocomplete
gem 'twitter-typeahead-rails'

#Use for http requests from api servers
gem "http", require:['http']

# Use paperclip to manange user uploaded images
gem "paperclip", "~> 5.0.0"

# Use for searching the website database for results
gem 'searchkick'

# Use specific meta tags for pages (SEO)
gem 'meta-tags'

# Handles User authentication for the site
gem 'devise'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record

#Use Postgresql as main database for the app
gem 'pg'
gem 'rails_12factor'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use jquery-ui with the JavaScript library
gem 'jquery-ui-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
#Turbolinks for Jquery so that .ready functions will work
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  #gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # derailed checks memory usage of gems
  gem 'derailed'
end

group :production do
    
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
