import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { patch } from "@rails/request.js"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      handle: ".drag-handle", // 掴み手となる要素のクラス名
      animation: 150,        // 並び替え時のアニメーション速度(ms)
      onEnd: this.onEnd.bind(this) // ドラッグ終了時に実行
    })
  }

  async onEnd(event) {
    const { newIndex, item } = event
    const url = item.dataset.sortableUrl
    
    // サーバーの update アクションへ位置情報を送信
    await patch(url, {
      body: JSON.stringify({
        category: { row_order_position: newIndex }
      }),
      responseKind: "json"
    })
  }
}
