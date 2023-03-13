import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["time"];

  connect() {
    console.log("test")
    this.startTime = new Date();
    this.endTime = new Date(this.startTime.getTime() + 30 * 60 * 1000); // 30 minutes in milliseconds
    console.log("test")
    this.timer = setInterval(() => {
      const currentTime = new Date();
      const timeLeft = this.endTime - currentTime;
      if (timeLeft < 0) {
        clearInterval(this.timer);
        this.timeTarget.innerHTML = "Time is up!";
      } else {
        const minutes = Math.floor(timeLeft / 1000 / 60);
        let seconds = Math.floor((timeLeft / 1000) % 60);
        seconds = seconds < 10 ? "0" + seconds : seconds;
        this.timeTarget.innerHTML = `${minutes}:${seconds}`;
      }
    }, 1000);
  }

  disconnect() {
    clearInterval(this.timer);
  }
}








// 'use strict';

// function countdown() {
//   const countSpan = document.getElementById("timer")
//   let timeLeft = 30 * 60; // 30 minutes in seconds
//   const countdownTimer = setInterval(function() {
//     const minutes = Math.floor(timeLeft / 60);
//     let seconds = timeLeft % 60;
//     seconds = seconds < 10 ? '0' + seconds : seconds;
//     countSpan.innerHTML =`Time remaining: ${minutes}:${seconds}`;
//     if (timeLeft <= 0) {
//       clearInterval(countdownTimer);
//       countSpan.innerHTML = 'Time to switch roles!';
//     }
//     timeLeft--;
//   }, 1000);
// }

// function timer(seconds){
//   clearInterval(countdown);
//   displayRemainingTime(seconds);
//   const then = Date.now() + seconds * 1000;
//   countdown = setInterval(() => {
//       const secondsLeft = Math.round((then - Date.now()) / 1000);
//       if(secondsLeft < 0) {
//           clearInterval(countdown);
//           return;
//       }
//       displayRemainingTime(secondsLeft);
//   }, 1000)
// }

// function displayTimeLeft(){
// //update dom
// }
