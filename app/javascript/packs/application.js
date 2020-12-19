// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// NAVBAR

window.onload = function () {

  // burger
  let hamButton = document.querySelector(".hamburger")
  let contentMobileShow = document.querySelector(".content-mobile");
  
  hamButton.addEventListener("click", () => {
  
    if (contentMobileShow.style.display === "none" || contentMobileShow.style.display === "") {
      contentMobileShow.style.display = "block";
    } else {
      contentMobileShow.style.display = "none";
    }
  });

  // pricings
  let tarifone = 12.50;
  let tariftwo = 13.50;
  let tariftree = 15;
  let inputs = document.querySelectorAll('.number');
  let sumPepoles = document.querySelector('#sumPepole');
  let sumTotal = document.querySelector('.sumTotal');

  for (let y = 0; y < inputs.length ; y++) {
    inputs[y].addEventListener( 'input', event => {
      let sumPepople = 0;
      let numbers = [];
      for (let i = 0; i < inputs.length ; i++) {
        numbers.push(inputs[i].value)
        sumPepople += parseInt(inputs[i].value)
      };

      
      let devis = 0;
      sumPepoles.innerHTML = sumPepople;
      devis += (numbers[1]*tarifone) + (numbers[2]*tariftwo) + (numbers[3]*tariftree);
      sumTotal.innerHTML = devis
    });

  };

  inputs[y].addEventListener('keypress');


  // go_to_the_park
  navigator.geolocation.getCurrentPosition(showPosition);

let longitude = 0;
let latitude = 0;

function showPosition(position) {
	latitude = position.coords.latitude;
	longitude =position.coords.longitude;

	let carte = L.map("carte").setView([48.852969, 2.349903],13)
	L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png',).addTo(carte)
	L.routing.control({
		waypoints: [
			L.latLng(latitude, longitude ),
			L.latLng(48.871900, 2.776623)
	],
		geocoder: L.Control.Geocoder.nominatim(),
		lineOptions: {
			styles: [{
				color: '#C9116A',
				opacity: 1,
			}]
		},
		router: new L.Routing.osrmv1({
			language: 'fr'
		})
	}).addTo(carte)
} 


// calendar 



}







// GAME
