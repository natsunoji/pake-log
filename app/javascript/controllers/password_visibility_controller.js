import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "icon" ]

  toggle() {
    const type = this.inputTarget.type === "password" ? "text" : "password"
    this.inputTarget.type = type

    // アイコンの見た目を切り替える（Bootstrap Iconsを使用）
    this.iconTarget.classList.toggle("bi-eye")
    this.iconTarget.classList.toggle("bi-eye-slash")
  }
}