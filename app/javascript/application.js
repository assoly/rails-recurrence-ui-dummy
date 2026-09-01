import "@hotwired/turbo-rails"
import { application } from "controllers/application"
import { registerRecurrenceUiController } from "recurrence_ui"

// 1. Register the RecurrenceUiController with the Stimulus application
registerRecurrenceUiController(application)

// 2. Load the remaining controllers for the application (from app/javascript/controllers/index.js)
import "controllers"