// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   connect() {
//     const btn = document.getElementById('btn');
//     const cardGrid = document.getElementById('gridjs');
//     const mapContainer = document.getElementById('mapjs');

//     btn.addEventListener('click', (event) => {
//     event.preventDefault();
//     const isMobilePortrait = window.innerWidth <= 575.98 && window.innerHeight > window.innerWidth;
//       if (isMobilePortrait) {
//         if (window.getComputedStyle(cardGrid).display !== 'none') {
//           cardGrid.style.display = 'none';
//           mapContainer.style.display = 'block';
//           btn.textContent = 'Boats';
//         } else {
//           cardGrid.style.display = 'grid';
//           mapContainer.style.display = 'none';
//           btn.textContent = 'Map';
//         }
//       }
//     });

//     const handleResize = () => {
//       const isMobilePortrait = window.innerWidth <= 575.98 && window.innerHeight > window.innerWidth;
//       if (isMobilePortrait) {
//         cardGrid.style.display = 'grid';
//         mapContainer.style.display = 'none';
//       } else {
//         cardGrid.style.display = 'grid';
//         mapContainer.style.display = 'block';
//       }
//     };

//     window.addEventListener('resize', handleResize);
//     handleResize();
//   }
// };

    // window.addEventListener('resize', () => {
    //   const isMobilePortrait = window.innerWidth <= 575 && window.innerHeight > window.innerWidth;
    //   if (!isMobilePortrait) {
    //     cardGrid.style.display = 'grid';
    //     mapContainer.style.display = 'block';
    //   }
    // });



//         import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   connect() {
//     const btn = document.getElementById('btn');
//     const cardGrid = document.getElementById('gridjs');
//     const mapContainer = document.getElementById('mapjs');

//     const isMobilePortrait = () => {
//       return window.matchMedia("(orientation: portrait)").matches ||
//         (window.innerWidth < window.innerHeight && window.innerWidth <= 575);
//     };

//     const toggleViews = () => {
//       if (isMobilePortrait()) {
//         if (window.getComputedStyle(cardGrid).display !== 'none') {
//           cardGrid.style.display = 'none';
//           mapContainer.style.display = 'block';
//           btn.textContent = 'Boats';
//         } else {
//           cardGrid.style.display = 'grid';
//           mapContainer.style.display = 'none';
//           btn.textContent = 'Map';
//         }
//       }
//     };

//     btn.addEventListener('click', (event) => {
//       event.preventDefault();
//       toggleViews();
//     });

//     const handleResize = () => {
//        const isMobilePortrait = window.innerWidth <= 575.98 && window.innerHeight > window.innerWidth;
//       if (isMobilePortrait) {
//         cardGrid.style.display = 'grid';
//         mapContainer.style.display = 'none';
//       } else {
//         cardGrid.style.display = 'grid';
//         mapContainer.style.display = 'block';
//       }
//     };

//     window.addEventListener('resize', handleResize);
//     window.addEventListener('orientationchange', handleResize);

//     toggleViews(); // Initial view check
//   }
// };


// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   connect() {
//     const btn = document.getElementById('btn');
//     const cardGrid = document.getElementById('gridjs');
//     const mapContainer = document.getElementById('mapjs');
//     let isMapTouched = false; // Variable to track touch events in map

//     const isMobilePortrait = () => {
//       return window.innerWidth <= 575.98 && window.innerHeight > window.innerWidth;
//     };

//     const toggleViews = () => {
//       if (isMobilePortrait()) {
//         if (window.getComputedStyle(cardGrid).display !== 'none') {
//           cardGrid.style.display = 'none';
//           mapContainer.style.display = 'block';
//           btn.textContent = 'Boats';
//         } else {
//           cardGrid.style.display = 'grid';
//           mapContainer.style.display = 'none';
//           btn.textContent = 'Map';
//         }
//       }
//     };

//     btn.addEventListener('click', (event) => {
//       event.preventDefault();
//       toggleViews();
//     });

//     const handleResize = () => {
//       const isPortrait = isMobilePortrait();
//       if (isPortrait) {
//         cardGrid.style.display = 'grid';
//         mapContainer.style.display = 'none';
//       } else {
//         cardGrid.style.display = 'grid';
//         mapContainer.style.display = 'block';
//       }
//     };

//     window.addEventListener('resize', handleResize);
//     window.addEventListener('orientationchange', handleResize);

//     mapContainer.addEventListener('touchstart', () => {
//       isMapTouched = true;
//     });

//     mapContainer.addEventListener('touchmove', (event) => {
//       if (isMapTouched) {
//         event.preventDefault(); // Prevent default touchmove behavior if in map view
//       }
//     });

//     mapContainer.addEventListener('touchend', () => {
//       isMapTouched = false;
//     });

//     toggleViews(); // Initial view check
//   }
// };

// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   connect() {
//     const btn = document.getElementById('btn');
//     const cardGrid = document.getElementById('gridjs');
//     const mapContainer = document.getElementById('mapjs');
//     let isMapTouched = false; // Variable to track touch events in map

//     const isMobilePortrait = () => {
//             return window.matchMedia("(orientation: portrait)").matches ||
//               (window.innerWidth < window.innerHeight && window.innerWidth <= 575);
//           };

//     const showCardGrid = () => {
//       cardGrid.style.display = 'grid';
//       mapContainer.style.display = 'none';
//       btn.textContent = 'Map';
//     };

//     const showMap = () => {
//       cardGrid.style.display = 'none';
//       mapContainer.style.display = 'block';
//       btn.textContent = 'Boats';
//     };

//     btn.addEventListener('click', (event) => {
//       event.preventDefault();
//       if (isMobilePortrait()) {
//         if (window.getComputedStyle(cardGrid).display !== 'none') {
//           showMap();
//         } else {
//           showCardGrid();
//         }
//       }
//     });

//     const handleResize = () => {
//       const isPortrait = isMobilePortrait();
//       if (isPortrait) {
//         showCardGrid();
//       } else {
//         cardGrid.style.display = 'grid';
//         mapContainer.style.display = 'block';
//         btn.textContent = 'Boats';
//       }
//     };

//     window.addEventListener('resize', handleResize);
//     window.addEventListener('orientationchange', handleResize);

//     mapContainer.addEventListener('touchstart', () => {
//       isMapTouched = true;
//     });

//     mapContainer.addEventListener('touchmove', (event) => {
//       if (isMapTouched) {
//         event.preventDefault(); // Prevent default touchmove behavior if in map view
//       }
//     });

//     mapContainer.addEventListener('touchend', () => {
//       isMapTouched = false;
//     });

//     // Set the initial view based on the screen size
//     if (isMobilePortrait()) {
//       showCardGrid();
//     } else {
//       showMap();
//     }
//   }
// };


// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   connect() {
//     const btn = document.getElementById('btn');
//     const cardGrid = document.getElementById('gridjs');
//     const mapContainer = document.getElementById('mapjs');

//     const isMobilePortrait = () => {
//       return window.innerWidth <= 575.98 && window.innerHeight > window.innerWidth;
//     };

//     const showCardGrid = () => {
//       cardGrid.style.display = 'grid';
//       mapContainer.style.display = 'none';
//       btn.textContent = 'Map';
//     };

//     const showMap = () => {
//       cardGrid.style.display = 'none';
//       mapContainer.style.display = 'block';
//       btn.textContent = 'Boats';
//     };

//     btn.addEventListener('click', (event) => {
//       event.preventDefault();
//       if (isMobilePortrait()) {
//         if (window.getComputedStyle(cardGrid).display !== 'none') {
//           showMap();
//         } else {
//           showCardGrid();
//         }
//       }
//     });

//     const handleResize = () => {
//       const isPortrait = isMobilePortrait();
//       if (isPortrait) {
//         showCardGrid();
//       } else {
//         cardGrid.style.display = 'grid';
//         mapContainer.style.display = 'block';
//         btn.textContent = 'Boats';
//       }
//     };

//     window.addEventListener('resize', handleResize);
//     window.addEventListener('orientationchange', handleResize);

//     // Set the initial view based on the screen size
//     if (isMobilePortrait()) {
//       showCardGrid();
//     } else {
//       cardGrid.style.display = 'grid';
//       mapContainer.style.display = 'block';
//       btn.textContent = 'Boats';
//     }
//   }
// };

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const btn = document.getElementById('btn');
    const cardGrid = document.getElementById('gridjs');
    const mapContainer = document.getElementById('mapjs');
    let isMapTouched = false; // Variable to track touch events in map

    const isMobilePortrait = () => {
      return window.matchMedia("(orientation: portrait)").matches;
    };

    const showCardGrid = () => {
      cardGrid.style.display = 'grid';
      mapContainer.style.display = 'none';
      btn.textContent = 'Map';
    };

    const showMap = () => {
      cardGrid.style.display = 'none';
      mapContainer.style.display = 'block';
      btn.textContent = 'Boats';
    };

    btn.addEventListener('click', (event) => {
      event.preventDefault();
      if (isMobilePortrait()) {
        if (window.getComputedStyle(cardGrid).display !== 'none') {
          showMap();
        } else {
          showCardGrid();
        }
      }
    });

    const handleResize = () => {
      const isPortrait = isMobilePortrait();
      if (isPortrait) {
        showCardGrid();
      } else {
        cardGrid.style.display = 'grid';
        mapContainer.style.display = 'block';
        btn.textContent = 'Boats';
      }
    };

    window.addEventListener('resize', handleResize);
    window.addEventListener('orientationchange', handleResize);

    mapContainer.addEventListener('touchstart', () => {
      isMapTouched = true;
    });

    mapContainer.addEventListener('touchmove', (event) => {
      if (isMapTouched) {
        event.preventDefault(); // Prevent default touchmove behavior if in map view
      }
    });

    mapContainer.addEventListener('touchend', () => {
      isMapTouched = false;
    });

    // Set the initial view based on the screen size
    if (isMobilePortrait()) {
      showCardGrid();
    } else {
      cardGrid.style.display = 'grid';
      mapContainer.style.display = 'block';
      btn.textContent = 'Boats';
    }
  }
};
