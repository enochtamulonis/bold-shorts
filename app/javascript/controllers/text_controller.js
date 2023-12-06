import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="text"
export default class extends Controller {
  static values = { duration: { type: Number, default: 5 } };

  connect() {
    setTimeout(() => {
      this.element.classList.add("hidden");
    }, this.durationValue * 1000);
  }
}
