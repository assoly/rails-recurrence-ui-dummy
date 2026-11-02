
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Просто пиним гем стандартным способом, как будто он установлен:
pin "recurrence_ui", to: "recurrence_ui/index.js"
pin_all_from "app/javascript/recurrence_ui", under: "recurrence_ui"


pin "@fullcalendar/core", to: "https://ga.jspm.io/npm:@fullcalendar/core@6.1.22/index.js" # Или через jsdelivr:
pin "@fullcalendar/daygrid", to: "https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.22/+esm"
pin "@fullcalendar/timegrid", to: "https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@6.1.22/+esm"
pin "@fullcalendar/interaction", to: "https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.22/+esm"