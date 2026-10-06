import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["time", "zone"]

  connect() {
    this.updateClock()
    // Обновляем время каждую секунду
    this.timer = setInterval(() => this.updateClock(), 1000)
  }

  disconnect() {
    if (this.timer) clearInterval(this.timer)
  }

  updateClock() {
    const now = new Date()

    // Определение именованной временной зоны пользователя (например, Europe/Moscow или Asia/Tokyo)
    const timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone

    // Форматирование времени под локаль
    const timeString = now.toLocaleTimeString([], { 
      hour: '2-digit', 
      minute: '2-digit', 
      second: '2-digit' 
    })

    if (this.hasTimeTarget) this.timeTarget.textContent = timeString
    if (this.hasZoneTarget) this.zoneTarget.textContent = timeZone
  }
}