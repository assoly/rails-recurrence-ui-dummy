import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    // Используем глобальный класс FullCalendar
    if (typeof window.FullCalendar === "undefined") {
      console.error("FullCalendar script is not loaded")
      return
    }

    this.calendar = new window.FullCalendar.Calendar(this.containerTarget, {
      initialView: "dayGridMonth",
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "dayGridMonth,timeGridWeek,timeGridDay"
      },
      firstDay: 1, // Понедельник
      dayMaxEvents: 3,
      events: "/calendar.json",
      eventClick: (info) => {
        if (info.event.url) {
          info.jsEvent.preventDefault()
          if (window.Turbo) {
            window.Turbo.visit(info.event.url)
          } else {
            window.location.href = info.event.url
          }
        }
      }
    })

    this.calendar.render()
  }

  disconnect() {
    if (this.calendar) {
      this.calendar.destroy()
    }
  }
}