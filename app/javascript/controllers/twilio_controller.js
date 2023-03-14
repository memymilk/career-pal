import { Controller } from "@hotwired/stimulus"
const { connect, createLocalTracks } = require('twilio-video');

// Connects to data-controller="twilio"
export default class extends Controller {

    static targets = ["mediaDiv"]
    static values = {
    token: String,
  }
  connect() {
    console.log("Hello",this.element, this.tokenValue);
    createLocalTracks({
      audio: true,
      video: {height: 1080, width: 1920},
    }).then(localTracks => {
      console.log('1st promise')
      return connect(this.tokenValue, {
        tracks: localTracks
      });
    }).then(room => {
      this.addLocalParticipant(room)
      this.addExistingParticipants(room)
      this.prepareFutureParticipants(room)
      this.nameTarget.classList.remove('d-none')
    });
  }

  addLocalParticipant(room) {
    this.addParticipantTracks(room.localParticipant);
  }

  addExistingParticipants(room) {
    room.participants.forEach((participant) => this.addParticipantTracks(participant))
  }

  prepareFutureParticipants(room){
    room.on('participantConnected', participant => {
      this.addParticipantTracks(participant)
    });
  }

  addParticipantTracks(participant) {
    let i = 0
    participant.tracks.forEach(publication => {
      if (publication.track) {
        console.log('wtf is this')
        this.mediaDivTarget.appendChild(publication.track.attach());
      }
    });

    participant.on('trackSubscribed', track => {
      this.mediaDivTarget.appendChild(track.attach());
    });
  }
}
