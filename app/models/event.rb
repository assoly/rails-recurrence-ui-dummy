class Event < ApplicationRecord
    include RecurrenceUi::HasRecurrence
end
