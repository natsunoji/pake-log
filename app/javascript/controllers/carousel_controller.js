import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container", "dot"]

  connect() {
    this.updateDots()
  }

  // スクロール（スワイプ）した時に実行される関数
  updateDots() {
    const scrollLeft = this.containerTarget.scrollLeft
    const width = this.containerTarget.offsetWidth
    const index = Math.round(scrollLeft / width)

    this.dotTargets.forEach((dot, i) => {
      if (i === index) {
        // 今見ている枚数のドット：ネイビーで少し大きく
        dot.classList.add("bg-primary", "scale-125")
        dot.classList.remove("bg-primary/20")
      } else {
        // それ以外：薄いネイビーで小さく
        dot.classList.remove("bg-primary", "scale-125")
        dot.classList.add("bg-primary/20")
      }
    })
  }
}