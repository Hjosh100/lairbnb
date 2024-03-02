import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { option1: "Find your Lair", option2: "List all Lairs" };
  static targets = ["togglableElement", "toggleButton"];

  connect() {
    console.log("Hello from toggle_controller.js");
    this.toggleButtonTarget.textContent = this.option1Value;
  }

  fire() {
    // this.elementClassList.toggle("container");
    this.togglableElementTarget.classList.toggle("d-none");
    if (this.toggleButtonTarget.textContent === this.option1Value) {
      this.toggleButtonTarget.textContent = this.option2Value;
    } else {
      this.toggleButtonTarget.textContent = this.option1Value;
    }
  }
}
