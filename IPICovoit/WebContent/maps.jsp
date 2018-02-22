<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <style>
   html, body {
       height: 100%;
       margin: 0;
       padding: 0;
   }

   #map_canvas {
       height: 400px;
       width: 700px;
       margin:50px auto;
   }
   </style>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwXO-yQirtjToPKH-aRvXAngfNFwWE1qc"></script>
<script>
/*function myMap(lat,lng) {
	var lat = 43.644010;
	var lng = 1.386933;
	  var myCenter = new google.maps.LatLng(lat, lng);
	  var myCenter2 = new google.maps.LatLng(43, 1.33);
	  var mapCanvas = document.getElementById("map");
	  var mapOptions = {center: myCenter, zoom: 12};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var marker = new google.maps.Marker({position:myCenter});
	  var marker2 = new google.maps.Marker({position:myCenter2});
	  marker.setMap(map);
	  marker2.setMap(map);
}*/
/*function initialiser(a,b,c) {
	var latlng = new google.maps.LatLng(46.779231, 6.659431);
	
	var options = {
		center: latlng,
		zoom: 19,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	
	var carte = new google.maps.Map(document.getElementById("carte"), options);
	
	

	//redéfinition du centre de la carte
	carte.setCenter(new google.maps.LatLng(46.779872043155, 6.6497500934796));
	//redéfinition du zoom
	carte.setZoom(15);
	
	//chemin du tracé
	var parcoursBus = [
		new google.maps.LatLng(46.781367900048, 6.6401992834884),
		new google.maps.LatLng(46.780821285011, 6.6416348016222),
		new google.maps.LatLng(46.778605381016, 6.6588674582321)
	];
	
	var traceParcoursBus = new google.maps.Polyline({
		path: parcoursBus,//chemin du tracé
		strokeColor: "#FF0000",//couleur du tracé
		strokeOpacity: 1.0,//opacité du tracé
		strokeWeight: 2//grosseur du tracé
	});
	
	//lier le tracé à la carte
	//ceci permet au tracé d'être affiché sur la carte
	traceParcoursBus.setMap(carte);

}*/
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
		    console.log(directionsService); 
		    
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

</script>
</head>
<body onload="initialize()">





test : 
<div id="map_canvas"></div>
<div id="latlng"></div>
</body>
</html>