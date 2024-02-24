import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  connect() {
    console.log("Hello")
  }

  accept(event) {
    console.log(event);
  }
}
