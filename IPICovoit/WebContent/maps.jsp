<div id="map_canvas"></div>
<style>
  html, body {
      height: 100%;
      margin: 0;
      padding: 0;
  }

  #map_canvas {
      height: 700px;
      width: 100%;
     /* margin:50px auto;*/
  }
 </style>
  
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwXO-yQirtjToPKH-aRvXAngfNFwWE1qc"></script>

<script>
/*
function initMap() {
	var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var map = new google.maps.Map(document.getElementById('map_canvas'), {
        zoom: 7,
        center: {lat: 41.85, lng: -87.65}
      });
      directionsDisplay.setMap(map);

      var onChangeHandler = function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay);
      };
      document.getElementById('start').addEventListener('change', onChangeHandler);
      document.getElementById('end').addEventListener('change', onChangeHandler);
}

function calculateAndDisplayRoute(directionsService, directionsDisplay) {
    directionsService.route({
      origin: document.getElementById('start').value,
      destination: document.getElementById('end').value,
      travelMode: 'DRIVING'
    }, function(response, status) {
      if (status === 'OK') {
        directionsDisplay.setDirections(response);
      } else {
        window.alert('Directions request failed due to ' + status);
      }
    });
  }


*/





//function initialize() {
	 var styles = {
		        'monTheme': [
		        {
		            featureType: 'road',
		            elementType: 'geometry',
		            stylers: [{'visibility': 'simplified'}]
		        }, {
		            featureType: 'road.arterial',
		            stylers: [
		                {hue: 149},
		                {saturation: -78},
		                {lightness: 0}
		            ]
		        }, {
		            featureType: 'road.highway',
		            stylers: [
		                {hue: -31},
		                {saturation: -40},
		                {lightness: 2.8}
		            ]
		        }, {
		            featureType: 'poi',
		            elementType: 'label',
		            stylers: [{'visibility': 'off'}]
		        }, {
		            featureType: 'landscape',
		            stylers: [
		                {hue: 163},
		                {saturation: -26},
		                {lightness: -1.1}
		            ]
		        }, {
		            featureType: 'transit',
		            stylers: [{'visibility': 'off'}]
		        }, {
		            featureType: 'water',
		            stylers: [
		                {hue: 3},
		                {saturation: -24.24},
		                {lightness: -38.57}
		            ]
		        }
		    ]};

	 		// options pour l'affichage de la maps
		    var mapOptions = {
		        zoom: 12,
		        center: new google.maps.LatLng(43.643987, 1.386879),
		        mapTypeId: google.maps.MapTypeId.ROADMAP,
		        disableDefaultUI: true,
		        mapTypeId: 'monTheme'
		    }
	 		//ouvrir la map
		    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
	 		//avec le style
		    var styledMapType = new google.maps.StyledMapType(styles['monTheme'], {name: 'monTheme'});
		    map.mapTypes.set('monTheme', styledMapType);

		    //latitude longitude campus
		    var myLatLng = new google.maps.LatLng(43.643987, 1.386879);
		    
		    //mettre le marker sur la map
		    var marker = new google.maps.Marker({
		        position: myLatLng,
		        title: 'Campus'
		    });
		    marker.setMap(map);
		    
//}

function direction_campus(adresse) {
	origin      = adresse; // Le point départ
    destination = '186 route de grenade'; // Le point d'arrivé
    var direction = new google.maps.DirectionsRenderer({ 'map': map });
    
    if(origin && destination){
        var request = {
            origin      : origin,
            destination : destination,
            travelMode  : google.maps.DirectionsTravelMode.DRIVING // Mode de conduite
        }
        var directionsService = new google.maps.DirectionsService(); // Service de calcul d'itinéraire
        directionsService.route(request, function(response, status){ // Envoie de la requête pour calculer le parcours
            if(status == google.maps.DirectionsStatus.OK){
                direction.setDirections(response); // Trace l'itinéraire sur la carte et les différentes étapes du parcours
            }
        });
    }
}

$('#direction_campus').on('click',function()
		{
			var value = $('#adresse_maison_campus').val();
			direction_campus(value);
		}
	);
</script>




