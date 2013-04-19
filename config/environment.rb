# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails applicationRails.env = ENV['RAILS_ENV'] || 'production'
Dingus.initialize!
