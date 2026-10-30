// app/javascript/controllers/theme_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    this.applyTheme(this.currentTheme)
  }

  // Действие при клике на переключатель
  switch(event) {
    const theme = event.currentTarget.dataset.themeSet
    this.setTheme(theme)
  }

  // Альтернативное переключение (тогл light <-> dark одной кнопкой)
  toggle() {
    const newTheme = this.isDark ? "light" : "dark"
    this.setTheme(newTheme)
  }

  setTheme(theme) {
    localStorage.setItem("theme", theme)
    this.applyTheme(theme)
  }

  applyTheme(theme) {
    const isDark =
      theme === "dark" ||
      (!theme && window.matchMedia("(prefers-color-scheme: dark)").matches)

    document.documentElement.classList.toggle("dark", isDark)

    // Обновление состояния всех кнопок переключения (если они заданы через targets)
    this.buttonTargets.forEach((btn) => {
      const active =
        (btn.dataset.themeSet === "dark" && isDark) ||
        (btn.dataset.themeSet === "light" && !isDark)

      btn.setAttribute("aria-pressed", active)
      btn.classList.toggle("bg-[var(--app-btn-primary-bg)]", active)
      btn.classList.toggle("text-white", active)
      btn.classList.toggle("text-[var(--app-text-muted)]", !active)
    })
  }

  get currentTheme() {
    return localStorage.getItem("theme")
  }

  get isDark() {
    return document.documentElement.classList.contains("dark")
  }
}