require "rails/all"

class Dingus < Rails::Application

  # Enable cache classes.
  config.cache_classes = true
  config.active_support.deprecation = :notify
  # remove some middleware we don't need
  config.middleware.delete "Rack::Lock"
  config.middleware.delete "ActionDispatch::Flash"
  config.middleware.delete "ActionDispatch::BestStandardsSupport"
  config.middleware.delete "ActionDispatch::Cookies"
  config.middleware.delete "ActionDispatch::Session::CookieStore"

end