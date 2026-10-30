import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    // Проверяем сохраненную тему при загрузке
    const savedTheme = localStorage.getItem("theme")
    const isDark = 
      savedTheme === "dark" || 
      (!savedTheme && window.matchMedia("(prefers-color-scheme: dark)").matches)

    if (isDark) {
      document.documentElement.classList.add("dark")
    } else {
      document.documentElement.classList.remove("dark")
    }
    
    this.updateUI()
  }

  toggle() {
    // Переключаем класс dark на теге <html>
    const isDark = document.documentElement.classList.toggle("dark")
    
    // Сохраняем выбор пользователя
    localStorage.setItem("theme", isDark ? "dark" : "light")
    
    this.updateUI()
  }

  updateUI() {
    const isDark = document.documentElement.classList.contains("dark")
    if (this.hasButtonTarget) {
      this.buttonTarget.setAttribute("aria-pressed", isDark)
    }
  }
}