import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["time", "button"];

  connect() {

    // if 2nd video is loaded
    // restart when switchRolesBtn is pressed
    // if 2nd countdown is done - end call/ go to feedback

   this.startTimer()
  }

  startTimer() {
    this.startTime = new Date();
    this.endTime = new Date(this.startTime.getTime() + 30 * 60 * 1000); // 30 minutes in milliseconds
    this.timer = setInterval(() => {
      const currentTime = new Date();
      const timeLeft = this.endTime - currentTime;
      if (timeLeft < 0) {
        clearInterval(this.timer);
        this.timeTarget.innerHTML = "Time to switch roles!";
        this.buttonTarget.click()
      } else {
        const minutes = Math.floor(timeLeft / 1000 / 60);
        let seconds = Math.floor((timeLeft / 1000) % 60);
        seconds = seconds < 10 ? "0" + seconds : seconds;
        this.timeTarget.innerHTML = `${minutes}:${seconds}`;
      }
    }, 1000);
  }

  restartTimer() {
    console.log("restartTimer")
    clearInterval(this.timer)
    this.startTimer()
  }
}
