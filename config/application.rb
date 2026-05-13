ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

require "rails/all"
Bundler.require(*Rails.groups)

module Dingus
  class Application < Rails::Application

    # config.api_only = true
    # Enable cache classes.
    config.cache_classes = true
    config.eager_load = true
    config.active_support.deprecation = :notify
    # remove some middleware we don't need
    config.middleware.delete ::Rack::Lock
    config.middleware.delete ActionDispatch::Flash
    config.middleware.delete ActionDispatch::Cookies
    config.middleware.delete ActionDispatch::Session::CookieStore

    secret_file = Rails.root.join('secret')
    if ENV['SECRET_KEY_BASE'].present?
      config.secret_key_base = ENV['SECRET_KEY_BASE']
    elsif File.exist?(secret_file)
      config.secret_key_base = File.read(secret_file).strip
    end
  end
end
