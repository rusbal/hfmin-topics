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

  Elm.Sample.init({ node: document.getElementById('elm'), flags })

  component.ports.setQuantity.send(0);

  component.ports.quantityChanged.subscribe((newQuantity) => {
    console.log(`Quantity changed to: ${newQuantity}`);
  })
})
