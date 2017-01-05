# Load the rails application
require_relative 'application'

# Initialize the rails application
Rails.env = ENV['RAILS_ENV'] || 'production'
Rails.application.initialize!
