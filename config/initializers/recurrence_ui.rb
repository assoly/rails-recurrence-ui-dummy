# config/initializers/recurrence_ui.rb
require "recurrence_ui"
RecurrenceUi.configure do |config|
  config.locale = :ru # Default locale for all components of the gem (if no locale is passed to the component)
  config.time_zone = "Europe/Moscow" # Default time zone for all components of the gem (if no time_zone is passed to the component)
  config.week_start = 1 # Week starts on Monday

  # Configuration for the enabled rule types in the UI:
  #config.enabled_rule_types = %w[
  #  never
  #  weekly
  #  daily
  #  monthly_by_day_of_month
  #]

  # All other options will be filtered out, and the order will be preserved as specified above.
  # config.enabled_rule_types = %w[
  #   never
  #   daily
  #   weekly
  #   monthly_by_day_of_month
  #   monthly_by_weekday
  #   yearly_by_day_of_month
  #   yearly_by_weekday
  # ]


end