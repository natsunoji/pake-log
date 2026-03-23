import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "modalImage"]

  open(event) {
    // data-image-modal-url-param からURLを取得
    const imageUrl = event.params.url
    if (imageUrl) {
      this.modalImageTarget.src = imageUrl
      this.modalTarget.classList.remove("hidden")
      document.body.style.overflow = "hidden"
    }
  }

  close() {
    this.modalTarget.classList.add("hidden")
    document.body.style.overflow = "auto"
  }
}