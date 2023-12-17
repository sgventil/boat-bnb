import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const btn = document.getElementById('btn');
    const cardGrid = document.getElementById('gridjs');
    const mapContainer = document.getElementById('mapjs');

    btn.addEventListener('click', (event) => {
    event.preventDefault();
    const isMobilePortrait = window.innerWidth <= 575 && window.innerHeight > window.innerWidth;
      if (isMobilePortrait) {
        if (window.getComputedStyle(cardGrid).display !== 'none') {
          cardGrid.style.display = 'none';
          mapContainer.style.display = 'block';
          btn.textContent = 'Boats';
        } else {
          cardGrid.style.display = 'grid';
          mapContainer.style.display = 'none';
          btn.textContent = 'Map';
        }
      }
    });
  }
};
