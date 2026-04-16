pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

# controllersディレクトリ全体を自動で読み込む
pin_all_from "app/javascript/controllers", under: "controllers"

pin "@rails/activestorage", to: "@rails--activestorage.js"
pin "@rails/request.js", to: "https://ga.jspm.io/npm:@rails/request.js@0.0.9/src/index.js"
pin "sortablejs", to: "https://unpkg.com/sortablejs@1.15.0/modular/sortable.complete.esm.js"
