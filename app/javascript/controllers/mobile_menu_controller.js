import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]

  connect() {
    this.handleKeydown = this.handleKeydown.bind(this)
    document.addEventListener("keydown", this.handleKeydown)
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleKeydown)
  }

  toggle() {
    if (this.sidebarTarget.classList.contains("hidden")) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    this.sidebarTarget.classList.remove("hidden")
    this.sidebarTarget.classList.add("flex")

    document.querySelector(
      '[data-action~="click->mobile-menu#toggle"]'
    )?.setAttribute("aria-expanded", "true")
  }

  close() {
    // На десктопе меню должно оставаться видимым.
    if (window.matchMedia("(min-width: 1024px)").matches) {
      return
    }

    this.sidebarTarget.classList.add("hidden")
    this.sidebarTarget.classList.remove("flex")

    document.querySelector(
      '[data-action~="click->mobile-menu#toggle"]'
    )?.setAttribute("aria-expanded", "false")
  }

  handleKeydown(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }
}