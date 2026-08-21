# config/initializers/recurrence_ui.rb
require "recurrence_ui"
RecurrenceUi.configure do |config|
  config.locale = :ru # Локаль по умолчанию для всех компонентов гема (если не передан locale в компонент)
  config.time_zone = "Europe/Moscow" # Часовой пояс по умолчанию для всех компонентов гема (если не передан time_zone в компонент)
  config.week_start = 1 # Неделя начинается с понедельника
  
  # Пользователь выбирает только нужные опции и задает желаемый порядок отображения в селекте:
  config.enabled_rule_types = %w[
    never
    weekly
    daily
    monthly_by_day_of_month
  ]

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