<script>

var map;
var directionsService;
var directionsDisplay;


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
	 
	directionsService = new google.maps.DirectionsService;
    directionsDisplay = new google.maps.DirectionsRenderer;
    map = new google.maps.Map(document.getElementById('my_google_maps'), {
        zoom: 12,
        center: new google.maps.LatLng(43.643987, 1.386879),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true,
        mapTypeId: 'monTheme'
      });
      directionsDisplay.setMap(map);
      
      var myLatlngCampus = {lat: 43.643987, lng:1.386879};
      marker = new google.maps.Marker({
    	    position: myLatlngCampus,
    	    title:'Campus Igs Toulouse'
    	});
      
      marker.setMap(map);
      
      var infosCampusBulle = '<div>Campus IGS Toulouse</div>';
      
      var infosCampus = new google.maps.InfoWindow({
          content: infosCampusBulle
        });
      
      marker.addListener('click', function() {
    	  infosCampus.open(map, this);
        });

      var styledMapType = new google.maps.StyledMapType(styles['monTheme'], {name: 'monTheme'});
      map.mapTypes.set('monTheme', styledMapType);
      
      var onChangeHandler = function() {
        calculateAndDisplayRoute(directionsService, directionsDisplay, '');
        $('#value_lat_search_conducteur').val('');
        $('#value_lng_search_conducteur').val('');
      };
      
       var geocoder = new google.maps.Geocoder();
      
       /*
       * GET LAT AND LNG AND PUT IN THE HIDDEN INPUT
       */
      document.getElementById('button_search_conducteur').addEventListener('click', function() {
          geocodeAddress(geocoder, map);
        });
      document.getElementById('button_search_conducteur').addEventListener('click', onChangeHandler);
      
}

/* 
 * FAIRE LE TRAJET DEMANDE
 */
function calculateAndDisplayRoute(directionsService, directionsDisplay, address) {
	if (address == '')
		{
		address = document.getElementById('adresse_conducteur').value;
		}
    directionsService.route({
      origin: address,
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
 
 /*
 *
 */
 function geocodeAddress(geocoder, resultsMap, address) {
     var address = document.getElementById('adresse_conducteur').value;
     geocoder.geocode({'address': address}, function(results, status) {
       if (status === 'OK') {
         resultsMap.setCenter(results[0].geometry.location);
         var marker = new google.maps.Marker({
           map: resultsMap,
           position: results[0].geometry.location
         });
		$('#button_search_conducteur').css('border','0px solid red');
		$('#verifConducteurMessage').css('display','none');
         $('#value_lat_search_conducteur').val(results[0].geometry.location.lat());
         $('#value_lng_search_conducteur').val(results[0].geometry.location.lng());
       } else {
         alert('Erreur: ' + status);
       }
     });
   }

 
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwXO-yQirtjToPKH-aRvXAngfNFwWE1qc&callback=initMap"></script>
