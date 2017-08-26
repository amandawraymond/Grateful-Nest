source 'https://rubygems.org'

# For Heroku to be able to use the desired Ruby version
ruby '2.2.3'
gem 'rails', '4.2.2'
gem 'pg'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Rails Html Sanitizer for HTML sanitization
gem 'rails-html-sanitizer', '~> 1.0'

# For managing front-end assets via Bower
gem 'bower-rails'

# For serving Angular templates through the Rails asset pipeline
gem 'angular-rails-templates'

# For Angular to work with CSRF protection
gem 'ng-rails-csrf'

# For using respond_with
gem 'responders'

# Bootstrap front-end framework.
# We use the gem, rather than Bower, due to the former's ease of integration
# over the latter.
gem 'bootstrap-sass', '~> 3.3.0'

# For Bootstrap compatible Rails form helpers
gem 'bootstrap_form'

gem 'font-awesome-rails', '~> 4.4'

# For auto-prefixing Sass/CSS styles with vendor prefixes
gem 'autoprefixer-rails'

# To support Angular HTML5 mode. For a detailed discussion, see
# http://mbell697.github.io/2014/02/04/yeoman-angular-rails-html5mode.
# Also take a look within /config/application.rb (search for 'rewrite'), for
# code and comments that help explain the server support this feature requires.
gem 'rack-rewrite'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# markdown parser
gem 'redcarpet', '~> 3.4.0'
gem 'bypass', git: 'git@github.com:amandawraymond/bypass.git'

# Gems required for deploying on Heroku
group :production, :staging do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
  gem 'rails_serve_static_assets'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0.0.beta2'
  gem 'spring'

  # For Rails code testing
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl'

  # For Angular and JS code testing
  gem 'teaspoon'
end
