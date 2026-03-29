import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "input", 
    "image", 
    "placeholderIcon", 
    "count", 
    "removeButton",
    "coverLabel",
    "previewBox"
  ]

  connect() {
    this.allImages = []
    this.newFiles = []
    this.deletedIds = []
    
    // 既存画像を読み込み
    this.previewBoxTargets.forEach((box) => {
      const img = box.querySelector('[data-input-images-target="image"]')
      if (img && img.src && !img.classList.contains('hidden')) {
        const imageId = box.querySelector('[data-image-id]')?.dataset.imageId
        this.allImages.push({ type: 'persisted', id: imageId, src: img.src })
      }
    })
    this.renderAll()
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

    const totalCount = this.allImages.length + this.newFiles.length
    const availableSlots = 3 - totalCount
    if (availableSlots <= 0) return

    const filesToAdd = newFiles.slice(0, availableSlots)
    this.newFiles = [...this.newFiles, ...filesToAdd]
    
    this.renderAll()
    this.syncToInput()
  }

  remove(e) {
    const index = parseInt(e.currentTarget.dataset.index)
    const allData = this.getAllImagesData()
    const imageData = allData[index]
    
    if (!imageData) return

    if (imageData.type === 'persisted') {
      this.deletedIds.push(imageData.id)
      this.allImages = this.allImages.filter(img => img.id !== imageData.id)
    } else {
      const newFileIndex = imageData.fileIndex
      this.newFiles.splice(newFileIndex, 1)
    }
    
    this.renderAll()
    this.syncToInput()
    this.syncDeletedIds()
  }

  getAllImagesData() {
    const result = []
    this.allImages.forEach(img => result.push({ type: 'persisted', id: img.id, src: img.src }))
    this.newFiles.forEach((file, index) => result.push({ type: 'new', file: file, fileIndex: index }))
    return result
  }

  renderAll() {
    const allImagesData = this.getAllImagesData()
    
    this.previewBoxTargets.forEach((box, index) => {
      const img = box.querySelector('[data-input-images-target="image"]')
      const icon = box.querySelector('[data-input-images-target="placeholderIcon"]')
      const btn = box.querySelector('[data-input-images-target="removeButton"]')
      const cover = box.querySelector('[data-input-images-target="coverLabel"]')
      
      const data = allImagesData[index]
      
      if (data) {
        if (btn) {
          btn.dataset.index = index
          btn.classList.remove('hidden')
        }
        
        if (data.type === 'persisted') {
          img.src = data.src
          img.classList.remove('hidden')
          icon?.classList.add('hidden')
        } else {
          const reader = new FileReader()
          reader.onload = (e) => {
            img.src = e.target.result
            img.classList.remove('hidden')
            icon?.classList.add('hidden')
          }
          reader.readAsDataURL(data.file)
        }
        
        if (cover) {
          index === 0 ? cover.classList.remove('hidden') : cover.classList.add('hidden')
        }
      } else {
        // 🌟 画像がない場合：アイコンを復活させる
        img.src = ''
        img.classList.add('hidden')
        icon?.classList.remove('hidden')
        btn?.classList.add('hidden')
        cover?.classList.add('hidden')
      }
    })
    this.updateCount()
  }
  
  syncDeletedIds() {
    this.element.querySelectorAll('input[name="item[delete_image_ids][]"]').forEach(input => input.remove())
    this.deletedIds.forEach(id => {
      const input = document.createElement('input')
      input.type = 'hidden'
      input.name = 'item[delete_image_ids][]'
      input.value = id
      this.element.appendChild(input)
    })
  }

  syncToInput() {
    const dataTransfer = new DataTransfer()
    this.newFiles.forEach(file => dataTransfer.items.add(file))
    this.inputTarget.files = dataTransfer.files
  }

  updateCount() {
    this.countTarget.textContent = this.allImages.length + this.newFiles.length
  }
}