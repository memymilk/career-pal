import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="feedback-form"
export default class extends Controller {
  static targets = ["loading", "row1", "row2", "row3"]

  connect() {
    setTimeout(() => {
      this.row1Target.classList.remove('d-none')
      this.loadingTarget.classList.add('d-none')
    }, 2000)
  }

  showRow2() {
    this.row2Target.classList.remove('d-none')
    this.row1Target.classList.add('d-none')
  }

  showRow3() {
    this.row3Target.classList.remove('d-none')
    this.row2Target.classList.add('d-none')
  }
}
