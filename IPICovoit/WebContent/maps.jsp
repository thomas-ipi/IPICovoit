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

$('#direction_campus').on('click',function()
		{
			var value = $('#adresse_maison_campus').val();
		});

function initialize() {
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

		    var mapOptions = {
		        zoom: 6,
		        center: new google.maps.LatLng(48,2),
		        mapTypeId: google.maps.MapTypeId.ROADMAP,
		        disableDefaultUI: true,
		        mapTypeId: 'monTheme'
		    }
		    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
		    var styledMapType = new google.maps.StyledMapType(styles['monTheme'], {name: 'monTheme'});
		    map.mapTypes.set('monTheme', styledMapType);

		    var myLatLng = new google.maps.LatLng(48.583148,7.747882);
		    var marker = new google.maps.Marker({
		        position: myLatLng,
		        map: map,
		        icon: 'star.png',
		        title: 'Strasbourg'
		    });

		    var myLatLng2 = new google.maps.LatLng(47.218371,-1.553621);
		    var marker2 = new google.maps.Marker({
		        position: myLatLng2,
		        map: map,
		        icon: 'flag.png',
		        title: 'Nantes'
		    });

		    
		    origin      = '186 route de grenade'; // Le point départ
		    destination = 'Paris'; // Le point d'arrivé
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
		    //$('#latlng').text(request); 
		    //console.log(directionsService); 
		    
		    /*
		    var directionsService = new google.maps.DirectionsService();
		    var directionsDisplay = new google.maps.DirectionsRenderer({ 'map': map });
		    var request = {
		        origin : myLatLng,
		        destination: myLatLng2,
		        travelMode : google.maps.DirectionsTravelMode.DRIVING,
		        unitSystem: google.maps.DirectionsUnitSystem.METRIC
		    };
		    directionsService.route(request, function(response, status) {
		        if (status == google.maps.DirectionsStatus.OK) {
		            directionsDisplay.setDirections(response);
		            directionsDisplay.setOptions({'suppressMarkers':true});
		        }
		    });*/ 
}
initialize();
</script>




