source 'https://ruby.taobao.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use sqlite3 as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'puma', '~> 2.9.0'
# for pagination https://github.com/amatsuda/kaminari
gem 'kaminari', '~> 0.16.1'
# A way simple configuration / settings solution  https://github.com/binarylogic/settingslogic
gem 'settingslogic', '~> 2.0.9'
# Delay job : https://github.com/mperham/sidekiq/wiki
gem 'sidekiq', '~> 3.2.1'
gem 'sinatra', '>= 1.3.0', :require => nil
#For performance activity tracker
gem 'newrelic_rpm', '~> 3.9.1.236'
        
group :development do 
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'

	# Deploy server with capistrano, https://github.com/capistrano/capistrano
	gem 'capistrano', '~> 3.2.1', require: false
	gem 'capistrano-rvm', '~> 0.1.1'
	gem 'capistrano-rails', '~> 1.1.1'
	gem 'capistrano-bundler', '~> 1.1.2'
	gem 'capistrano3-puma', '~> 0.6.1'
  gem 'capistrano-sidekiq', '~> 0.3.5'

	# Annotate the models attributes, https://github.com/ctran/annotate_models
	gem 'annotate', '~> 2.6.5'

end

group :development, :test do
  gem 'rspec-rails', '~> 3.0.1'
  gem 'factory_girl_rails', '~> 4.4.1'

  #Code Debug: https://github.com/deivid-rodriguez/byebug
  gem 'byebug', '~> 3.1.2' 
end

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc




