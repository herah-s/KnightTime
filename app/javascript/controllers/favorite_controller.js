import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favorite"
export default class extends Controller {
  connect() {
  }
  toggle_favorite(event) {
    event.currentTarget.classList.toggle("favorite")
  }

}
