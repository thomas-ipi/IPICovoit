var address;

function inscription()
{
	//$('body').append('<div class="container containerInscription"><div class="blocInscription"><form method="post" class="form-group" action=""><center><h2>Inscription<input value="X" style="max-width:40px;margin-left:10%;margin-top:-10px" class="btn btn-danger" onclick="closeInscription()"/></h2></center><hr/><br><div class="row" style="margin-left:0px;margin-right:0px"><input type="text" class="form-control col-md-6" id="nomInscription" placeholder="Nom"/><input type="text" class="form-control col-md-6" id="prenomInscription" placeholder="Prénom"/></div><br><input type="tel" class="form-control"  id="telInscription" placeholder="Téléphone"/><br><input type="email" class="form-control"  id="mailInscription" placeholder="Mail"/><br><input type="password" class="form-control"  id="mdp1Inscription" placeholder="Mot de Passe"/><br><input type="password" class="form-control"  id="mdp2Inscription" placeholder="Confirmer le mot de passe"/><br><center><input onclick="verifInscription()" type="btn" class="btn btn-danger" value="Valider"/></center></form></div></div>');
	$('.containerInscription').css('display', 'block');
}

function closeInscription()
{
	$('.containerInscription').css('display', 'none');
}


function getTrajects()
{
    type = $('input[name=ar]:checked').val();
    fumeur = $('input[name=f]:checked').val();
    date = $('#datePickerPassager').val();
    
    $.ajax({
        url : 'GetTraject',
        type : 'POST',
        data : 'arg0='+type+'&arg1='+fumeur+'&arg2='+date,
        success: function (data) {
           myJson = JSON.parse(data);
           /* Réccupère le premier champs de la première ligne */
           
           console.log(myJson);
           
           myJson['trajets'].forEach(function(element) {	
               var myLatlng = {lat: parseFloat(element[1]), lng:parseFloat(element[2])};
               var marker = new google.maps.Marker({
             	    position: myLatlng,
             	    title:element[0]
             	});
               
               var contentString = '<div id="content">'+
               '<div id="siteNotice">'+
               '</div>'+
               '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
               '<div id="bodyContent">'+
               '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
               'sandstone rock formation in the southern part of the '+
               'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
               'south west of the nearest large town, Alice Springs; 450&#160;km '+
               '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
               'features of the Uluru - Kata Tjuta National Park. Uluru is '+
               'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
               'Aboriginal people of the area. It has many springs, waterholes, '+
               'rock caves and ancient paintings. Uluru is listed as a World '+
               'Heritage Site.</p>'+
               '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
               'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
               '(last visited June 22, 2009).</p>'+
               '</div>'+
               '</div>';

           var infowindow = new google.maps.InfoWindow({
             content: contentString
           });

           marker.setMap(map);






           marker.addListener('click', function() {
             infowindow.open(map, marker);
           });
           });
        }
     });
    
    
}


function verifTrajet()
{
	if ($('#value_lat_search_conducteur').val() != '' && $('#value_lng_search_conducteur').val() != '')
		{
			return true;
		} else
			{
				$('#button_search_conducteur').css('border','2px solid red');
				$('#verifConducteurMessage').css('display','block');
				return false;
			}
}

function verifInscription()
{
	
	/* Vérification nom + prénom : mini 2 caractères */
	var nomInscription = $('#nomInscription').val();
	var prenomInscription = $('#prenomInscription').val();
	if (nomInscription.length <=1)
	{
		$('#nomInscription').css('border', '3px solid red');
		$('#nameHelp').css('display', 'block');
		errorNom = true;
	} else 
	{
		$('#nomInscription').css('border', 'none');
		$('#nameHelp').css('display', 'none');
		errorNom = false;
	}
	
	if (prenomInscription.length <=1)
	{
		$('#prenomInscription').css('border', '3px solid red');
		$('#nameHelp').css('display', 'block');
		errorPrenom = true;
	} else 
	{
		$('#prenomInscription').css('border', 'none');
		$('#nameHelp').css('display', 'none');
		errorPrenom = false;
	}
	
	/* Vérification téléphone : 10 chiffres + Que des nombres */
	var telInscription = $('#telInscription').val();
	if (((/^[0-9]*$/.test(telInscription)) == true)){
		if (telInscription.length != 10)
		{
			$('#telInscription').css('border', '3px solid red');
			$('#telHelp').css('display', 'block');
			errorTel = true;
		} else 
		{
			$('#telInscription').css('border', 'none');
			$('#telHelp').css('display', 'none');
			errorTel = false;
		}
	}
	else
	{
		$('#telInscription').css('border', '3px solid red');
		errorTel = true;
	}
	

	/* Vérification si l'extension mail est bien "@campus-igs-toulouse.fr" */
	var mailInscription = $('#mailInscription').val();
	extension = mailInscription.substring(mailInscription.lastIndexOf("@"));
	if (extension != '@campus-igs-toulouse.fr')
	{
		$('#mailInscription').css('border', '3px solid red');
		$('#mailHelp').css('display', 'block');
		errorMail = true;
	} else 
	{
		$('#mailInscription').css('border', 'none');
		$('#mailHelp').css('display', 'none');
		errorMail = false;
	}
	
	/* Vérification si mots de passe identiques*/
	var mdp1Inscription = $('#mdp1Inscription').val();
	var mdp2Inscription = $('#mdp2Inscription').val();
	
	if (mdp1Inscription != mdp2Inscription)
	{
		$('#mdp1Inscription').css('border', '3px solid red');
		$('#mdp2Inscription').css('border', '3px solid red');
		$('#mdpHelp2').css('display', 'block');
		errorMdp = true;
	} else 
	{
		if (mdp1Inscription.length <=4)
			{
				$('#mdp1Inscription').css('border', '3px solid red');
				$('#mdp2Inscription').css('border', '3px solid red');
				$('#mdpHelp2').css('display', 'none');
				$('#mdpHelp1').css('display', 'block');
				errorMdp = true;
			}
		else
			{
				$('#mdp1Inscription').css('border', 'none');
				$('#mdp2Inscription').css('border', 'none');
				$('#mdpHelp1').css('display', 'none');
				$('#mdpHelp2').css('display', 'none');
				errorMdp = false;
			}
	}
	
	/* Return final */
	if (errorNom == false && errorPrenom == false && errorTel == false && errorMail == false && errorMdp == false)
		{
		return true;
		}
	else
		{
		return false;
		}
}