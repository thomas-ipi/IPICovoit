function inscription()
{
	//$('body').append('<div class="container containerInscription"><div class="blocInscription"><form method="post" class="form-group" action=""><center><h2>Inscription<input value="X" style="max-width:40px;margin-left:10%;margin-top:-10px" class="btn btn-danger" onclick="closeInscription()"/></h2></center><hr/><br><div class="row" style="margin-left:0px;margin-right:0px"><input type="text" class="form-control col-md-6" id="nomInscription" placeholder="Nom"/><input type="text" class="form-control col-md-6" id="prenomInscription" placeholder="Prénom"/></div><br><input type="tel" class="form-control"  id="telInscription" placeholder="Téléphone"/><br><input type="email" class="form-control"  id="mailInscription" placeholder="Mail"/><br><input type="password" class="form-control"  id="mdp1Inscription" placeholder="Mot de Passe"/><br><input type="password" class="form-control"  id="mdp2Inscription" placeholder="Confirmer le mot de passe"/><br><center><input onclick="verifInscription()" type="btn" class="btn btn-danger" value="Valider"/></center></form></div></div>');
	$('.containerInscription').css('display', 'block');
}

function closeInscription()
{
	$('.containerInscription').css('display', 'none');
}

function verifTrajet()
{
	if ($('#value_lat_search_conducteur').val() != '' && $('#value_lng_search_conducteur').val() != '')
		{
			return true;
		} else
			{
				alert('Merci de vérifier si le trajet existe !');
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