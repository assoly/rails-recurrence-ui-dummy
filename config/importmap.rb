# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# recurrence_ui: должно работать и без этого
# pin_all_from File.expand_path("../../recurrence_ui/app/javascript/controllers", __dir__), under: "controllers"