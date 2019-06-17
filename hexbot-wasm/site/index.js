const js = import("./node_modules/@npmdirk/hexbot-wasm/hexbot_wasm.js");
js.then(js => {
  js.greet("WebAssembly");
});