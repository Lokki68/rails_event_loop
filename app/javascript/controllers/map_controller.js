import { Controller } from "@hotwired/stimulus";
import L from "leaflet";
import "leaflet/dist/leaflet.css";

delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl:
    "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png",
  iconUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png",
  shadowUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png",
});

export default class extends Controller {
  static targets = ["address", "map", "latitude", "longitude"];

  connect() {
    // console.log("🗺️ Stimulus map controller connecté");

    this.map = L.map(this.mapTarget).setView([48.8566, 2.3522], 13);

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 19,
      attribution: "© OpenStreetMap contributors",
    }).addTo(this.map);

    this.marker = L.marker([48.8566, 2.3522]).addTo(this.map);
  }

  async search() {
    const query = this.addressTarget.value.trim();
    if (!query) return;

    // console.log("Recherche :", query);

    const url = `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(
      query
    )}`;
    const response = await fetch(url);
    const results = await response.json();

    if (results.length === 0) return alert("Adresse introuvable");

    const { lat, lon, display_name } = results[0];
    // console.log(`✅ Trouvé : ${display_name}`);

    this.map.setView([lat, lon], 14);
    this.marker.setLatLng([lat, lon]);

    // Remplir les champs cachés latitude / longitude
    if (this.hasLatitudeTarget) this.latitudeTarget.value = lat;
    if (this.hasLongitudeTarget) this.longitudeTarget.value = lon;
  }
}
