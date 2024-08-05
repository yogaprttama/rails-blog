import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "reveal" ]
  static classes = [ "toggle" ]

  toggle() {
    this.revealTarget.classList.toggle(this.toggleClass)
  }
}
