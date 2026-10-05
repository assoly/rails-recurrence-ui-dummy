class Webinar < ApplicationRecord
    include Mobility

    include RecurrenceUi::HasRecurrence

    
    # 1. Объявляем переводимые поля через бэкенд :container
    translates :title, :description

    has_recurrence  rules:      :schedule_json,
                    start_time: :starts_at,
                    end_time:   :finishes_at,
                    time_zone:  :time_zone_name
end
