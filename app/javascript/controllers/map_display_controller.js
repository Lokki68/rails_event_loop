import { Controller } from "@hotwired/stimulus";
import L from "leaflet";
import "leaflet/dist/leaflet.css";

// Corrige les icônes manquantes
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl:
    "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png",
  iconUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png",
  shadowUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png",
});

// Connecté quand le composant s’affiche
export default class extends Controller {
  static values = {
    latitude: Number,
    longitude: Number,
  };

  connect() {
    if (!this.latitudeValue || !this.longitudeValue) return;

    this.map = L.map(this.element).setView(
      [this.latitudeValue, this.longitudeValue],
      13
    );

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: "&copy; OpenStreetMap contributors",
    }).addTo(this.map);

    L.marker([this.latitudeValue, this.longitudeValue]).addTo(this.map);
  }
}
