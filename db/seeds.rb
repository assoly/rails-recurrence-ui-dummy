# db/seeds.rb

puts "Очищаем данные..."
[Event, Task, Webinar].each(&:destroy_all)

LOCALES = %i[en ru ja uk be].freeze

DUMMY_CONTENT = {
  Event => {
    en: { title: "Team Sync", description: "<p>Weekly release sync.</p>" },
    ru: { title: "Встреча команды", description: "<p>Еженедельное обсуждение.</p>" },
    ja: { title: "チームミーティング", description: "<p>週次のミーティング。</p>" },
    uk: { title: "Зустріч команди", description: "<p>Щотижнева зустріч.</p>" },
    be: { title: "Сустрэча каманды", description: "<p>Штотыднёвая сустрэча.</p>" }
  },
  Task => {
    en: { title: "Database Backup", description: "<p>Backup task.</p>" },
    ru: { title: "Резервное копирование", description: "<p>Задача бэкапа.</p>" },
    ja: { title: "DBバックアップ", description: "<p>バックアップタスク。</p>" },
    uk: { title: "Резервне копіювання", description: "<p>Завдання бэкапу.</p>" },
    be: { title: "Рэзервовае капіяванне", description: "<p>Задача бэкапу.</p>" }
  },
  Webinar => {
    en: { title: "Rails 7 Masterclass", description: "<p>Deep dive into Rails.</p>" },
    ru: { title: "Мастер-класс по Rails 7", description: "<p>Погружение в Rails.</p>" },
    ja: { title: "Rails 7 マスタークラス", description: "<p>Railsの深掘り。</p>" },
    uk: { title: "Майстер-клас з Rails 7", description: "<p>Занурення в Rails.</p>" },
    be: { title: "Майстар-клас па Rails 7", description: "<p>Пагружэнне ў Rails.</p>" }
  }
}.freeze

RULE_CASES = [
  {
    name: "Daily interval 3",
    hash: { rrules: [{ rule_type: "IceCube::DailyRule", interval: 3 }] }
  },
  {
    name: "Weekly Mon & Wed",
    hash: { rrules: [{ rule_type: "IceCube::WeeklyRule", interval: 1, validations: { day: [1, 3] } }] }
  },
  {
    name: "Monthly 1st & last Mon",
    hash: { rrules: [{ rule_type: "IceCube::MonthlyRule", interval: 1, validations: { day_of_week: { "1" => [1, -1] } } }] }
  }
].freeze

[Event, Task, Webinar].each do |model_class|
  puts "Заполнение #{model_class.name}..."

  # 1. Динамически определяем имя поля правил у модели
  rules_field = model_class.respond_to?(:recurrence_rules_field) ? model_class.recurrence_rules_field : :recurring_rules
  
  # 2. Динамически определяем имя поля даты начала у модели
  start_field = model_class.respond_to?(:recurrence_start_time_field) ? model_class.recurrence_start_time_field : :start_at

  RULE_CASES.each_with_index do |test_case, index|
    attributes = {
      start_field => Time.current.beginning_of_day + index.days,
      rules_field => test_case[:hash] # Динамически подставляем :recurring_rules, :recurrence_data или :schedule_json
    }

    LOCALES.each do |locale|
      content = DUMMY_CONTENT[model_class][locale]
      attributes["title_#{locale}"] = "#{content[:title]} [#{test_case[:name]}]"
      attributes["description_#{locale}"] = "#{content[:description]} <p><em>Case: #{test_case[:name]}</em></p>"
    end

    model_class.create!(attributes)
  end
end

puts "Готово!"