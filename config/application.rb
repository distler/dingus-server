ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

require "rails/all"
Bundler.require(*Rails.groups)

module Dingus
  class Application < Rails::Application

    # Enable cache classes.
    config.cache_classes = true
    config.active_support.deprecation = :notify
    # remove some middleware we don't need
    config.middleware.delete "Rack::Lock"
    config.middleware.delete "ActionDispatch::Flash"
    config.middleware.delete "ActionDispatch::Cookies"
    config.middleware.delete "ActionDispatch::Session::CookieStore"

  end
end
