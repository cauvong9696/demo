require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    config.load_defaults 5.2
    config.cache_store = :redis_store, {
      host: "localhost",
      port: 6379,
      db: 0,
    }, {expires_in: 7.days}
  end
end
