import { Controller } from "@hotwired/stimulus"
import { Calendar } from "@fullcalendar/core"
import dayGridPlugin from "@fullcalendar/daygrid"
import timeGridPlugin from "@fullcalendar/timegrid"
import interactionPlugin from "@fullcalendar/interaction"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.calendar = new Calendar(this.containerTarget, {
      plugins: [dayGridPlugin, timeGridPlugin, interactionPlugin],
      initialView: "dayGridMonth", // По умолчанию вид месяца
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "dayGridMonth,timeGridWeek,timeGridDay" // Кнопки переключения
      },
      firstDay: 1, // Понедельник
      dayMaxEvents: 3, // Сворачивать события в "+X еще", если их много
      events: "/calendar.json", // Запрос к Rails-контроллеру за данными
      
      // Клик по событию — переход на его страницу
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