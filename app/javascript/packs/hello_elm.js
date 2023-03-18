// Run this example by adding <%= javascript_pack_tag "hello_elm" %> to the
// head of your layout file, like app/views/layouts/application.html.erb.
// It will render "Hello Elm!" within the page.

import {
  Elm
} from '../Sample'

document.addEventListener('DOMContentLoaded', () => {
  const flags = {
    name: "Pusa",
    api_root: "root",
    quantity: 0,
    books: gon.books
  }

  const app = Elm.Sample.init({ node: document.getElementById('elm'), flags })

  app.ports.quantityChanged.subscribe((newQuantity) => {
    console.log(`Quantity changed to: ${newQuantity}`);
  })

  const jsNumber = document.getElementById('js-number')
  jsNumber.addEventListener("keyup", event => {
    if (event.isComposing || event.keyCode === 229) {
      return;
    }
    app.ports.setQuantity.send(parseInt(event.target.value))
  });
})
