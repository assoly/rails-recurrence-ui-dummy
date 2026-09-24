class Event < ApplicationRecord
    include RecurrenceUi::HasRecurrence
    
    has_recurrence  rules:      :schedule_json,
                    start_time: :starts_at,
                    end_time:   :finishes_at,
                    time_zone:  :time_zone_name
end
