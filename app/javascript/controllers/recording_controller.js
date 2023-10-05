import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recording"
export default class extends Controller {
  static targets = ["start", "stop"]
  connect() {
    this.audioChunks = [];
    this.audioPlayer = document.getElementById('audioPlayer');
  }
  async start() {
    this.startTarget.classList.add("hidden")
    this.stopTarget.classList.remove("hidden")
    let stream = await navigator.mediaDevices.getUserMedia({ audio: true });

      this.mediaRecorder = new MediaRecorder(stream);

      this.mediaRecorder.ondataavailable = (event) => {
        if (event.data.size > 0) {
          this.audioChunks.push(event.data);
        }
      };

      this.mediaRecorder.onstop = () => {
        let audioBlob = new Blob(this.audioChunks, { type: 'audio/wav' });
        let audioUrl = URL.createObjectURL(audioBlob);
        audioPlayer.src = audioUrl;
      };

      this.mediaRecorder.start();
  }

  stop() {
    this.stopTarget.classList.add("hidden")
    this.startTarget.classList.remove("hidden")
    if (this.mediaRecorder && this.mediaRecorder.state !== 'inactive') {
      this.mediaRecorder.stop();
    }
  }
}
