import Reveal from "@stimulus-components/reveal";

export default class RevealController extends Reveal {
  static targets = ["button", "item"];

  toggle() {
    super.toggle();
    this.buttonTarget.style.transform = this.isRevealed()
      ? "rotate(180deg)"
      : "rotate(0deg)";
  }

  isRevealed() {
    return !this.itemTarget.classList.contains("hidden");
  }
}
