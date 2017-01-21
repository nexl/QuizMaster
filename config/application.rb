require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Quiz
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.version = '1.0'
    config.assets.precompile += %w['*.js', '*.css', '*.css.erb','*.png', '*.jpg', '*.jpeg' ,'*.gif', '*.erb', '*.svg', '*.scss', '*.sass', '*.svg']
  end
end

module ReactTesting
  class Application < Rails::Application
    config.react.addons = true
  end
end