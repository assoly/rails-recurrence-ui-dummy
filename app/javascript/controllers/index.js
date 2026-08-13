// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// 1. Импортируем контроллер гема
import RecurrenceUiController from "recurrence_ui_controller"

// 2. Регистрируем под именем "recurrence-ui"
application.register("recurrence-ui", RecurrenceUiController)