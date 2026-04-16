# config/importmap.rb

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

# 🌟 自作コントローラーの入り口と共通基盤をピン留め
pin "controllers", to: "controllers/index.js"
pin "controllers/application", to: "controllers/application.js"

# 🌟 index.js で import する全てのコントローラーを個別にピン留め
# これにより、本番環境での 404（指紋不一致）を物理的に防ぐ
pin "controllers/carousel_controller", to: "controllers/carousel_controller.js"
pin "controllers/flash_controller", to: "controllers/flash_controller.js"
pin "controllers/hello_controller", to: "controllers/hello_controller.js"
pin "controllers/image_modal_controller", to: "controllers/image_modal_controller.js"
pin "controllers/image_preview_controller", to: "controllers/image_preview_controller.js"
pin "controllers/input_images_controller", to: "controllers/input_images_controller.js"
pin "controllers/password_visibility_controller", to: "controllers/password_visibility_controller.js"
pin "controllers/sortable_controller", to: "controllers/sortable_controller.js"

# 🌟 外部ライブラリ
pin "@rails/activestorage", to: "@rails--activestorage.js"
pin "@rails/request.js", to: "https://ga.jspm.io/npm:@rails/request.js@0.0.9/src/index.js"
pin "sortablejs", to: "https://unpkg.com/sortablejs@1.15.0/modular/sortable.complete.esm.js"
