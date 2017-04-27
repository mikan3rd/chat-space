require_relative 'boot'

require 'rails/all'
require 'sass-globbing'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false
    end
  end
end
