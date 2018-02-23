<div id="map_canvas"></div>

<script>

/*
 * INITIALISER MAPS
 */
function initMap() {
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
	
	var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var map = new google.maps.Map(document.getElementById('map_canvas'), {
        zoom: 12,
        center: new google.maps.LatLng(43.643987, 1.386879),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true,
        mapTypeId: 'monTheme'
      });
      directionsDisplay.setMap(map);

      var styledMapType = new google.maps.StyledMapType(styles['monTheme'], {name: 'monTheme'});
      map.mapTypes.set('monTheme', styledMapType);
      
      var onChangeHandler = function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay);
      };
      document.getElementById('direction_campus').addEventListener('click', onChangeHandler);
      //document.getElementById('end').addEventListener('change', onChangeHandler);
}

/*
 * FAIRE LE TRAJET DEMANDE
 */
function calculateAndDisplayRoute(directionsService, directionsDisplay) {
    directionsService.route({
      origin: document.getElementById('adresse_maison_campus').value,
      destination: '186 route de grenade, 31700',
      travelMode: 'DRIVING'
    }, function(response, status) {
      if (status === 'OK') {
        directionsDisplay.setDirections(response);
      } else {
        window.alert('Directions request failed due to ' + status);
      }
    });
 }
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwXO-yQirtjToPKH-aRvXAngfNFwWE1qc&callback=initMap"></script>


