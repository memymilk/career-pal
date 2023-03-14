import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-switch"
export default class extends Controller {

  static targets = ["button"];

  connect() {
    console.log('hello from toggle switch controller')
  }

  switchBtn() {
    console.log(this.buttonTarget.checked);
    if (this.buttonTarget.checked) {
      this.buttonTarget.checked = false
    } else {
      this.buttonTarget.checked = true
    }
  }

  deactivateBtn() {
    this.buttonTarget.checked = false
  }

}
