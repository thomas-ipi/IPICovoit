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
	
	/* Vérification nom + prénom : mini 2 caractères */
	var nomInscription = $('#nomInscription').val();
	var prenomInscription = $('#prenomInscription').val();
	if (nomInscription.length <=1)
	{
		$('#nomInscription').css('border', '3px solid red');
		errorNom = true;
	} else {errorNom = false};
	
	if (prenomInscription.length <=1)
	{
		$('#prenomInscription').css('border', '3px solid red');
		errorPrenom = true;
	} else {errorPrenom = false};
	
	
	/* Vérification téléphone : 10 chiffres + Que des nombres */
	var telInscription = $('#telInscription').val();
	if (((/^[0-9]*$/.test(telInscription)) == true)){
		if (telInscription.length != 10)
		{
			$('#telInscription').css('border', '3px solid red');
			errorTel = true;
		} else {errorTel = false};
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
		errorMail = true;
	} else {errorMail = false};
	
	
	/* Vérification si mots de passe identiques*/
	var mdp1Inscription = $('#mdp1Inscription').val();
	var mdp2Inscription = $('#mdp2Inscription').val();
	
	if (mdp1Inscription != mdp2Inscription)
	{
		$('#mdp1Inscription').css('border', '3px solid red');
		$('#mdp2Inscription').css('border', '3px solid red');
		errorMdp = true;
	} else {errorMdp = false};
	
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