import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["time", "zone"]

  connect() {
    this.updateClock()
    this.timer = setInterval(() => this.updateClock(), 1000)
  }

  disconnect() {
    if (this.timer) clearInterval(this.timer)
  }

  updateClock() {
    const now = new Date()

    // Берем зону, переданную из Rails в zoneTarget (например, "Asia/Tokyo" или "Europe/Moscow")
    const timeZone = this.hasZoneTarget && this.zoneTarget.textContent.trim() 
      ? this.zoneTarget.textContent.trim() 
      : Intl.DateTimeFormat().resolvedOptions().timeZone

    try {
      // Форматируем время с учетом часового пояса пользователя
      const timeString = now.toLocaleTimeString([], { 
        timeZone: timeZone,
        hour: '2-digit', 
        minute: '2-digit', 
        second: '2-digit' 
      })

      if (this.hasTimeTarget) {
        this.timeTarget.textContent = timeString
      }
    } catch (e) {
      // Если передана некорректная зона, вывод системного времени браузера
      this.timeTarget.textContent = now.toLocaleTimeString()
    }
  }
}