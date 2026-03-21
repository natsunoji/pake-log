// app/javascript/controllers/image_preview_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "preview", "placeholder" ]

  // 画像が選択された（change）ときに動く関数
  preview(event) {
    const input = event.target
    if (input.files && input.files[0]) {
      const reader = new FileReader()
      reader.onload = (e) => {
        // プレビュー画像を表示し、枠の見た目を整える
        this.previewTarget.style.backgroundImage = `url(${e.target.result})`
        this.previewTarget.style.borderStyle = 'solid'
        this.previewTarget.style.borderColor = '#bef264' // lime-300
        
        // アイコンと文字を隠す
        this.placeholderTarget.classList.add('hidden')
      }
      reader.readAsDataURL(input.files[0])
    }
  }
}