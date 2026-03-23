import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "previewBox", "image", "placeholderIcon", "count", "coverLabel"]

  connect() {
    // ページ読み込み時の画像数をカウント
    this.updateCount()
  }

  triggerFile() {
    this.inputTarget.click()
  }

  triggerCamera() {
    this.inputTarget.setAttribute("capture", "environment")
    this.inputTarget.click()
    setTimeout(() => this.inputTarget.removeAttribute("capture"), 500)
  }

  preview() {
    const files = Array.from(this.inputTarget.files)
    if (files.length === 0) return

    // プレビュー表示をリセット
    this.imageTargets.forEach((img, i) => {
      img.classList.add("hidden")
      this.placeholderIconTargets[i].classList.remove("hidden")
      if (i === 0 && this.hasCoverLabelTarget) this.coverLabelTarget.classList.add("hidden")
    })

    // 選択された新しい画像を表示
    files.slice(0, 3).forEach((file, index) => {
      const reader = new FileReader()
      reader.onload = (e) => {
        this.imageTargets[index].src = e.target.result
        this.imageTargets[index].classList.remove("hidden")
        this.placeholderIconTargets[index].classList.add("hidden")
        if (index === 0 && this.hasCoverLabelTarget) this.coverLabelTarget.classList.remove("hidden")
      }
      reader.readAsDataURL(file)
    })

    this.updateCount()
  }

  // 編集時は「削除」ボタンの動作を一旦無効化（Railsの複雑な挙動を避けるため）
  remove(e) {
    const index = parseInt(e.currentTarget.dataset.index)
    alert("画像を個別に削除する場合は、新しい画像を撮り直して上書きしてください。")
  }

  updateCount() {
    const currentCount = this.imageTargets.filter(img => !img.classList.contains('hidden')).length
    this.countTarget.textContent = currentCount
  }

  // syncInput は使わずに Rails の標準送信に任せます
}