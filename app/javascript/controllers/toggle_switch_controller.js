import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "rails/actioncable"

// Connects to data-controller="toggle-switch"
export default class extends Controller {
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "WaitingroomChannel" },
      { received: data => console.log("data:", data) }
    )
    console.log("this:", this)
  }
}
