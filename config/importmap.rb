# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# recurrence_ui: должно работать и без этого
pin "@fullcalendar/core", to: "@fullcalendar--core.js" # @6.1.21
pin "@fullcalendar/daygrid", to: "@fullcalendar--daygrid.js" # @6.1.21
pin "@fullcalendar/interaction", to: "@fullcalendar--interaction.js" # @6.1.21
pin "@fullcalendar/timegrid", to: "@fullcalendar--timegrid.js" # @6.1.21
