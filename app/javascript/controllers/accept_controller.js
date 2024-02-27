import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller
export default class extends Controller {
  static targets = ["accept", "booking"]

  connect() {
    console.log("Hello");
    // console.log(this.acceptTarget);
    // console.log(this.acceptTarget.value)
  }

  confirm(event) {
    event.preventDefault();

    const form = document.getElementById("edit_lair_1");
    // console.log(this.bookingTarget)
    // console.log(form.accepted)
    // console.log(form)
    const accepted = document.getElementById("lair_accepted")
    // const formDataAccepted = new FormData(form);
    // console.log(accepted);
    // const accepted = document.querySelector(".btn");
    // console.log(accepted.innerHTML);
    fetch(this.bookingTarget.action, {
      method: "PATCH", headers: { "Accept": "application/json" },
      body: new FormData(form)
    })
      .then(response => response.json())
      .then((data) => {console.log(data)})

    // let button = document.querySelector(".accept-button")
    // button.addEventListener("click", (event))
    // fetch(this.buttonTarget.action, {
    //   method: "PATCH",
    //   headers: { "Accept": "application" }
    //   body
    // })
  };
};
