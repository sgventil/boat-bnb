// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   connect() {
//     if (document.readyState === 'complete') {
//       this.initializeFacebookButton();
//     } else {
//       window.addEventListener('load', () => {
//         this.initializeFacebookButton();
//       });
//     }
//   }

//   initializeFacebookButton() {
//     const facebookContainer = document.getElementById('facebook-login-container');
//     const facebookButton = document.createElement('fb:login-button');
//     facebookButton.setAttribute('scope', 'public_profile,email');
//     facebookButton.setAttribute('onlogin', 'checkLoginState();');
//     facebookContainer.appendChild(facebookButton);
//   }

//   facebookLogin() {
//     FB.login(function(response) {
//       if (response.authResponse) {
//         const accessToken = response.authResponse.accessToken;
//         window.location.href = '/';
//       } else {
//         // Handle login failure
//       }
//     }, { scope: 'public_profile,email' });
//   }
// }
