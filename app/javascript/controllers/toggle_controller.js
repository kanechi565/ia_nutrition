import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["show", "hideable"]
  connect() {
  }
  call(event) {
    event.preventDefault()
    console.log(this.showTarget)
    this.hideableTarget.classList.toggle("d-none")
    this.showTarget.classList.toggle("d-none")


    // if (this.hideableTarget.classList.contains("d-none")) {
    //   this.hideableTarget.classList.remove("d-none")
    //   this.showTarget.classList.add("d-none")
    // } else {
    //   this.hideableTarget.classList.add("d-none")
    //   this.showTarget.classList.remove("d-none")
    // }
  }
}
