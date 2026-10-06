import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab", "panel"]

  select(event) {
    const selectedLocale = event.currentTarget.dataset.locale

    // 1. Подсветка активной кнопки переключения
    this.tabTargets.forEach(tab => {
      const active = tab.dataset.locale === selectedLocale
      if (active) {
        tab.classList.add("app-btn-primary")
        tab.classList.remove("text-[var(--app-text-muted)]", "hover:bg-[var(--app-bg-nav)]")
      } else {
        tab.classList.remove("app-btn-primary")
        tab.classList.add("text-[var(--app-text-muted)]", "hover:bg-[var(--app-bg-nav)]")
      }
    })

    // 2. Отображение нужного блока полей
    this.panelTargets.forEach(panel => {
      panel.classList.toggle("hidden", panel.dataset.locale !== selectedLocale)
    })
  }
}