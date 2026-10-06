# db/seeds.rb

puts "Очистка старых данных..."
Event.destroy_all

# Список локалей берется автоматически (например, [:en, :ru, :ja])
locales = I18n.available_locales

puts "Генерация тестовых событий..."

10.times do
  event_attributes = {}

  # Для каждой локали генерируем текст на соответствующем языке
  locales.each do |locale|
    Faker::Config.locale = locale
    puts "Генерация события на локали: #{locale}"
    # Генерируем динамические атрибуты: title_ru, title_en, description_ru, description_en...
    event_attributes["title_#{locale}"] = Faker::Book.title
    event_attributes["description_#{locale}"] = "<p>#{Faker::Lorem.paragraph(sentence_count: 3)}</p>"
  end

  # Добавляем общие непереводимые поля
  event_attributes[:start_at] = Faker::Time.between(from: DateTime.now, to: DateTime.now + 30.days)
  event_attributes[:end_at] = event_attributes[:start_at] + 2.hours

  # Создаем запись
  Event.create!(event_attributes)
end

puts "Создано событий: #{Event.count}"