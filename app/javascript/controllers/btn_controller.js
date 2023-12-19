import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const btn = document.getElementById('btn');
    const cardGrid = document.getElementById('gridjs');
    const mapContainer = document.getElementById('mapjs');

    btn.addEventListener('click', (event) => {
      event.preventDefault();
      if (window.getComputedStyle(cardGrid).display !== 'none') {
        cardGrid.style.display = 'none';
        mapContainer.style.display = 'block';
        btn.textContent = 'Boats';
      } else {
        cardGrid.style.display = 'grid';
        mapContainer.style.display = 'none';
        btn.textContent = 'Map';
      }
    });

    const handleResize = () => {
      const isLargerThan575px = window.matchMedia("(min-width: 576px)").matches;
      if (isLargerThan575px) {
        cardGrid.style.display = 'grid';
        mapContainer.style.display = 'block';
      } else if (window.getComputedStyle(cardGrid).display === 'none') {
        cardGrid.style.display = 'none';
        mapContainer.style.display = 'block';
        mapContainer.style.width = '100%';
      } else {
      cardGrid.style.display = 'grid';
      mapContainer.style.display = 'none';
      }
    }
    window.addEventListener('resize', handleResize);
    window.addEventListener('orientationchange', handleResize);
    handleResize();

  }
}
