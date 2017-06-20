require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Smartlab
  class Application < Rails::Application
    
    config.after_initialize do
      Rails.application.load_tasks
      Rake::Task[ 'db:create' ].invoke
      Rake::Task[ 'db:migrate' ].invoke
      Rake::Task[ 'db:setup' ].invoke
    end
  
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
