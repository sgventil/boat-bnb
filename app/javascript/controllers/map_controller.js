import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {apiKey: String, markers: Array}
  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    const maxZoomOutLevel = 4; // Set your maximum zoom out level
    // const maxBounds = [
    //   [-180, -35], // Southwest bound (longitude, latitude)
    //   [180, 35] // Northeast bound
    // ];

    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v12',
      center: [-74.5, 40],
      zoom: 4
      // minZoom: maxZoomOutLevel
      // maxBounds: maxBounds
    });

    this.map.on('load', () => {
      this.map.setZoom(maxZoomOutLevel); // Set the zoom level to the maximum zoom out level on load
      this.#addMarkersToMap();
      this.#fitMapToMarkers();
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    })
    this.map.fitBounds(bounds, {
      padding: 40, duration: 25
      });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const markerElement = document.createElement("div");
      markerElement.className = "custom-marker";
      if (window.location.pathname.includes("/boats/") && !window.location.pathname.endsWith('/map_view')) {
        const popup = new mapboxgl.Popup({maxWidth: "600px", maxHeight: "200px"}).setHTML(marker.info_window);
        popup.options.offset = [0, -30];
        new mapboxgl.Marker({ element: markerElement })
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map);

      } else {
          markerElement.addEventListener("click", () => {
            const boatId = marker.boat;
            window.location.href = `/boats/${marker.boatId}`;
          });

          new mapboxgl.Marker({ element: markerElement })
            .setLngLat([marker.lng, marker.lat])
            .addTo(this.map);
        }
    });
  }
}
