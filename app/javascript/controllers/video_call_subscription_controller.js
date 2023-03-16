import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["tab", "video", "countdown"]
  static values = { videoCallId: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "VideoCallChannel", id: this.videoCallIdValue },
      { // received: stores the function which is called when data is broadcasted in the channel
        // data -> as string
        received: (data) => {
          console.log(data)
          this.tabTarget.innerHTML = data
          this.videoTarget.classList.add("second-video-true")
          this.countdownTarget.dataset.countdownTimerShouldStartValue = true
       }
      }
    )
    console.log(`Subscribed to the chatroom with the id ${this.videoCallIdValue}.`)
  }
}
