import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "content"];

  connect() {
    this.showTab(0); // Show the first tab by default
  }

  showTab(index) {
    this.tabTargets.forEach((tab, i) => {
      tab.classList.toggle('active-tab', i === index);
      this.contentTargets[i].style.display = i === index ? 'block' : 'none';
    });
  }

  changeTab(event) {
    const index = this.tabTargets.indexOf(event.currentTarget);
    this.showTab(index);
  }
}
