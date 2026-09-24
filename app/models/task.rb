class Task < ApplicationRecord
    include RecurrenceUi::HasRecurrence

    has_recurrence  rules:      :recurrence_data,
                    start_time: :due_date
end
