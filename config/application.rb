require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'
require 'active_job/railtie' # MY NOTE: Added this to enable ActiveJob
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems you've limited to
# :test, :development, or :production.
Bundler.require(*Rails.groups)

module GratefulNest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified
    # here. Application configuration should go into files in
    # config/initializers - all .rb files in that directory are automatically
    # loaded.
    config.autoload_paths += %W(#{config.root}/lib)

    # For not swallow errors in after_commit/after_rollback callbacks
    config.active_record.raise_in_transactional_callbacks = true

    # MY NOTE: bower-rails installs Bower components in the
    # vendor/assets/bower_components folder. Since this folder is not in the
    # Rails standard, we need to add it manually.
    config.assets.paths << Rails.root.join('vendor', 'assets',
                                           'bower_components')

    # MY NOTE: We keep Angular templates in app/assets/javascripts/templates,
    # which is non-standard for angular-rails-templates, so we need to tell it
    # where to look. We have chosen this non-standard approach to avoid name
    # collisions with identically named JS files. See
    # https://github.com/pitr/angular-rails-templates#5-avoid-name-collisions.
    config.angular_templates.ignore_prefix = %w(templates/)

    # MY NOTE: Stop generators from generating non-useful files
    config.generators do |g|
      g.assets = false
      g.helper = false
      g.template_engine = nil # Don't create views, since we're using Angular

      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: false

      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    # MY NOTE: Tell ActiveJob to use DelayedJob as the background task queue
    config.active_job.queue_adapter = :delayed_job

    # MY NOTE: Tell Rails to append a trailing slash when generating URLs, so
    # that they still nice after Angular adds the '#/'.
    config.action_controller.default_url_options = { trailing_slash: true }
  end
end
