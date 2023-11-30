import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["editElement", "bookElement"]

  connect() {
    console.log("connected");
  }

  fire() {
    this.editElementTarget.classList.toggle("d-none");
  }

  book() {
    this.bookElementTarget.classList.toggle("d-none");
  }
}
