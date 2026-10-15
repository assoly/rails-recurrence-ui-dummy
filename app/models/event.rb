class Event < ApplicationRecord
    include Mobility
    include RecurrenceUi::HasRecurrence

    # 1. Объявляем переводимые поля через бэкенд :container
    translates :title, :description


    has_recurrence      rules:      :recurring_rules,
                        start_time: :start_at,
                        end_time:   :end_at,
                        time_zone:  :time_zone,
                        duration:   :duration 

    # Одна главная картинка (обложка)
    has_one_attached :cover_image

    # Галерея изображений (множественная загрузка)
    has_many_attached :images
end