import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="toggle-switch"
export default class extends Controller {
  connect() {
    console.log("this:", this)
  }
}
