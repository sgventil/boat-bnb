import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {apiKey: String, markers: Array}
  connect() {
    const mapContainer = document.getElementById('map');
    mapContainer.innerHTML = '';
    mapContainer.style.width = '100%';
    mapContainer.style.height = '100vh';
    mapboxgl.accessToken = this.apiKeyValue
    const firstBoat = this.markersValue[0];
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v12',
      center: [firstBoat.lng, firstBoat.lat],
      zoom: 3,
      maxZoom: 18,
      minZoom: 3
    });

    // if (window.matchMedia("(max-width: 575.98px) and (orientation: portrait)").matches) {
    //   mapContainer.style.width = '100%';
    //   mapContainer.style.height = '100vh';
    // }

    // const resizeMap = () => {
    //   // Resize the map container when the window is resized
    //   if (window.matchMedia("(max-width: 575.98px) and (orientation: portrait)").matches) {
    //     mapContainer.style.width = '100%';
    //     mapContainer.style.height = '100vh';
    //   }
    // };

    // // Initialize the map when the DOM content is loaded
    // document.addEventListener('DOMContentLoaded', initializeMap);

    // // Call the resizeMap function whenever the window is resized
    // window.addEventListener('resize', resizeMap);



  // function resizeCanvas() {
  //   canvas.width = window.innerWidth;
  //   canvas.height = window.innerHeight;
  //   // Your drawing/rendering code here...
  // }

  // // Initial resize and listen for window resize events
  // window.addEventListener('resize', resizeCanvas);
  // resizeCanvas();
    this.#addMarkersToMap();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // const info_window = new mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement("div");

      customMarker.style.backgroundImage = `url("${marker.image_url}")`;
      customMarker.classList.add("custom-marker");
      if (window.location.pathname.includes("/boats/") && !window.location.pathname.endsWith('/map_view')) {
        const popup = new mapboxgl.Popup({maxWidth: "600px", maxHeight: "200px"}).setHTML(marker.info_window);
        popup.options.offset = [0, -30];
        new mapboxgl.Marker({ element: customMarker })
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map);

      } else {
          customMarker.addEventListener("click", () => {
            const boatId = marker.boat;
            window.location.href = `/boats/${marker.boatId}`;
          });

          new mapboxgl.Marker({ element: customMarker })
            .setLngLat([marker.lng, marker.lat])
            .addTo(this.map);
        }
    });
  }



  // #fitMapToMarkers() {
  //   const bounds = new mapboxgl.LngLatBounds()
  //   this.markersValue.forEach((marker) => {
  //     bounds.extend([marker.lng, marker.lat]);
  //   })
  //   this.map.fitBounds(bounds, {
  //     padding: 40, duration: 25
  //     });
  // }
}
