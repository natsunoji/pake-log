import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.dismiss()
    }, 3000)
  }

  dismiss() {
    this.element.style.transition = "opacity 0.5s"
    this.element.style.opacity = "0"
    
    setTimeout(() => {
      this.element.remove()
    }, 500)
  }
}