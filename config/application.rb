require_relative "boot"

require "rails/all"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    # Configuration for locales and time zones 
    config.i18n.available_locales = [:en, :ru, :be, :uk, :ja]
    # Time zone for the application by default
    #config.time_zone = "Europe/Moscow" # or "Asia/Tokyo"
    config.time_zone = "Asia/Tokyo"

    # Default locale for the application
    config.i18n.default_locale = :en # or :ru, :ja and so on.

    # First day of the week in Rails (:monday or :sunday)
    config.beginning_of_week = :monday



    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")


  end
end
