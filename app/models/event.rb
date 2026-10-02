class Event < ApplicationRecord
    include RecurrenceUi::HasRecurrence
    
    has_recurrence  rules:      :recurring_rules,
                        start_time: :start_at,
                        end_time:   :end_at,
                        time_zone:  :time_zone 
end