import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "image", "placeholderIcon", "count", "removeButton"]

  connect() {
    this.allFiles = [] // 🌟 選択したファイルを溜めておく配列
  }

  triggerFile() {
    this.inputTarget.removeAttribute("capture")
    this.inputTarget.click()
  }

  triggerCamera() {
    this.inputTarget.setAttribute("capture", "environment")
    this.inputTarget.click()
  }

  preview() {
    const newFiles = Array.from(this.inputTarget.files)
    if (newFiles.length === 0) return

    // 🌟 既存のファイルに新しいファイルを追加（最大3枚まで）
    this.allFiles = [...this.allFiles, ...newFiles].slice(0, 3)
    
    this.renderPreviews()
    this.syncToInput() // 🌟 重要：inputの中身を最新の状態に同期する
  }

  renderPreviews() {
    // 一旦リセット
    this.imageTargets.forEach((img, i) => {
      img.classList.add("hidden")
      img.src = ""
      this.placeholderIconTargets[i].classList.remove("hidden")
      if (this.hasRemoveButtonTargets && this.removeButtonTargets[i]) {
        this.removeButtonTargets[i].classList.add("hidden")
      }
    })

    // 配列の中身を表示
    this.allFiles.forEach((file, i) => {
      const reader = new FileReader()
      reader.onload = (e) => {
        this.imageTargets[i].src = e.target.result
        this.imageTargets[i].classList.remove("hidden")
        this.placeholderIconTargets[i].classList.add("hidden")
        if (this.hasRemoveButtonTargets && this.removeButtonTargets[i]) {
          this.removeButtonTargets[i].classList.remove("hidden")
        }
      }
      reader.readAsDataURL(file)
    })
    this.countTarget.textContent = this.allFiles.length
  }

  remove(e) {
    const index = parseInt(e.currentTarget.dataset.index)
    this.allFiles.splice(index, 1) // 配列から削除
    this.renderPreviews()
    this.syncToInput()
  }

  // 🌟 フォーム送信時にこの allFiles の中身が送られるようにする
  syncToInput() {
    const dataTransfer = new DataTransfer()
    this.allFiles.forEach(file => dataTransfer.items.add(file))
    this.inputTarget.files = dataTransfer.files
  }
}