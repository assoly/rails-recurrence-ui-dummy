class Task < ApplicationRecord
    include Mobility

    include RecurrenceUi::HasRecurrence

    
    # 1. Объявляем переводимые поля через бэкенд :container
    translates :title, :description


    has_recurrence  rules:      :recurrence_data,
                    start_time: :due_date
end
