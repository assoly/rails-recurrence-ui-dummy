class Event < ApplicationRecord
    include RecurrenceUi::HasRecurrence
    
    has_recurrence 
end
