import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "panel"];

  connect() {
    console.log("tabController =>", this.tabTargets);
    if (!this.tabTargets.some((tab) => tab.classList.contains("btn-active"))) {
      this.activate(this.tabTargets[0]);
    }
  }

  switch(event) {
    event.preventDefault();
    this.activate(event.currentTarget);
  }

  activate(tab) {
    const selected = tab.dataset.tab;

    this.tabTargets.forEach((t) => t.classList.remove("btn-active"));
    this.panelTargets.forEach((p) => p.classList.add("hidden"));

    tab.classList.add("btn-active");

    const panel = this.panelTargets.find((p) => p.dataset.tab === selected);

    if (panel) panel.classList.remove("hidden");
  }
}
