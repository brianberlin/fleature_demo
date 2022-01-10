import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
// Download from github
// wget https://github.com/brianberlin/fleature_js/releases/download/v0.0.2/index.bundled.js -O assets/js/fleature.js
import fleature from './fleature'

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})
liveSocket.connect()
liveSocket.enableDebug()

fleature.setup({
  clientId: 'aoABfvEdn33tvDBp29OQKg==',
  clientSecret: 'gYrs29/fyJNxpvpWP5YGooA+84U4s5IrlJ8JhnYoGnI=',
  host: 'localhost',
  port: 4001,
  protocol: 'ws',
  enabledFlags: ["javascript_feature_flag"]
})

console.log(fleature.isEnabled("javascript_feature_flag"))

const updateDOM = status => {
  const message = `Javascript Feature ${status ? "Enabled" : "Disabled"}`
  document.getElementById("javascript").innerHTML = message
}

updateDOM(fleature.isEnabled('javascript_feature_flag'))

fleature.subscribe('javascript_feature_flag', updateDOM)

fleature.subscribeAll(console.log)
