require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Smartlab
  class Application < Rails::Application
    
    # Data for all default entities
    default_users = JSON.parse(File.read("#{Rails.root}/db/bootstrap/users.json"))
    
    # Create all default entities from given data
    default_users.each do |user|
      User.create(user)
    end
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
