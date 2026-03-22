import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "previewBox", "image", "placeholderIcon", "count", "coverLabel"]

  connect() {
    this.selectedFiles = []
    
    // 修正ポイント1：送信ボタンが押された瞬間に、保持しているファイルをinputに詰め込む
    const form = this.element.closest("form")
    if (form) {
      form.addEventListener("submit", () => {
        this.syncInput()
      })
    }
  }

  // ファイル選択ボタン
  triggerFile() {
    this.inputTarget.click()
  }

  // カメラボタン
  triggerCamera() {
    this.inputTarget.setAttribute("capture", "environment")
    this.inputTarget.click()
    setTimeout(() => this.inputTarget.removeAttribute("capture"), 500)
  }

  // ファイルが選択された時
  preview() {
    const files = Array.from(this.inputTarget.files)
    if (files.length === 0) return

    files.forEach(file => {
      if (this.selectedFiles.length < 3) {
        this.selectedFiles.push(file)
      }
    })

    this.updateUI()
    this.syncInput()
    
    // 修正ポイント2：連続選択のために値を空にするが、selectedFilesには残っているのでOK
    this.inputTarget.value = ""
  }

  // 削除ボタン
  remove(e) {
    const index = parseInt(e.currentTarget.dataset.index)
    this.selectedFiles.splice(index, 1)
    this.updateUI()
    this.syncInput()
  }

  updateUI() {
    this.previewBoxTargets.forEach((box, index) => {
      const file = this.selectedFiles[index]
      const img = this.imageTargets[index]
      const icon = this.placeholderIconTargets[index]
      const cover = this.hasCoverLabelTarget ? this.coverLabelTarget : null
      const closeBtn = box.querySelector('button')

      if (file) {
        const reader = new FileReader()
        reader.onload = (e) => {
          img.src = e.target.result
          img.classList.remove("hidden")
          icon.classList.add("hidden")
          if (index === 0 && cover) cover.classList.remove("hidden")
        }
        reader.readAsDataURL(file)
        if (closeBtn) closeBtn.classList.remove("hidden")
      } else {
        img.src = ""
        img.classList.add("hidden")
        icon.classList.remove("hidden")
        if (index === 0 && cover) cover.classList.add("hidden")
        if (closeBtn) closeBtn.classList.add("hidden")
      }
    })
    this.countTarget.textContent = this.selectedFiles.length
  }

  // ★重要：JavaScript内のファイルをRailsのinputに流し込む
  syncInput() {
    const dataTransfer = new DataTransfer()
    this.selectedFiles.forEach(file => dataTransfer.items.add(file))
    this.inputTarget.files = dataTransfer.files
  }
}