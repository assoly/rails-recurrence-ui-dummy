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

  get isDesktop() {
    return window.matchMedia("(min-width: 1024px)").matches
  }

  toggle() {
    if (this.isDesktop) return

    this.sidebarTarget.classList.toggle("hidden")

    this.updateButton()
  }

  close() {
    if (this.isDesktop) return

    this.sidebarTarget.classList.add("hidden")

    this.updateButton()
  }

  handleKeydown(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }

  updateButton() {
    const isOpen = !this.sidebarTarget.classList.contains("hidden")

    this.element
      .querySelector('[data-action~="click->mobile-menu#toggle"]')
      ?.setAttribute("aria-expanded", String(isOpen))
  }
}