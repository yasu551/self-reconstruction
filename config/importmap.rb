# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "daisyui" # @4.12.14
pin "buffer" # @2.1.0
pin "camelcase-css" # @2.0.1
pin "css-selector-tokenizer" # @0.8.0
pin "cssesc" # @3.0.0
pin "culori/require", to: "culori--require.js" # @3.3.0
pin "fastparse" # @1.1.2
pin "fs" # @2.1.0
pin "nanoid/non-secure", to: "nanoid--non-secure.js" # @3.3.8
pin "path" # @2.1.0
pin "picocolors" # @1.1.1
pin "postcss" # @8.4.49
pin "postcss-js" # @4.0.1
pin "process" # @2.1.0
pin "source-map-js" # @1.2.1
pin "url" # @2.1.0
