function inscription()
{
	//$('body').append('<div class="container containerInscription"><div class="blocInscription"><form method="post" class="form-group" action=""><center><h2>Inscription<input value="X" style="max-width:40px;margin-left:10%;margin-top:-10px" class="btn btn-danger" onclick="closeInscription()"/></h2></center><hr/><br><div class="row" style="margin-left:0px;margin-right:0px"><input type="text" class="form-control col-md-6" id="nomInscription" placeholder="Nom"/><input type="text" class="form-control col-md-6" id="prenomInscription" placeholder="Prénom"/></div><br><input type="tel" class="form-control"  id="telInscription" placeholder="Téléphone"/><br><input type="email" class="form-control"  id="mailInscription" placeholder="Mail"/><br><input type="password" class="form-control"  id="mdp1Inscription" placeholder="Mot de Passe"/><br><input type="password" class="form-control"  id="mdp2Inscription" placeholder="Confirmer le mot de passe"/><br><center><input onclick="verifInscription()" type="btn" class="btn btn-danger" value="Valider"/></center></form></div></div>');
	$('.containerInscription').css('display', 'block');
}

function closeInscription()
{
	$('.containerInscription').css('display', 'none');
}

function verifInscription()
{
	/* Vérification téléphone : 10 chiffres + Que des nombres */
	var telInscription = $('#telInscription').val();
	if (((/^[0-9]*$/.test(telInscription)) == true)){
		if (telInscription.length == 10)
		{
			return true;
		} 
		else
		{
			alert('Erreur: le numéro de téléphone ne contient pas 10 chiffres.');
			return false;
		}
	}
	else
	{
		alert('Erreur: le numéro de téléphone ne doit contenir que des chiffres.');
		return false;
	}
	
	
	/* Vérification si l'extension mail est bien "@campus-igs-toulouse.fr" */
	var mailInscription = $('#mailInscription').val();	
}