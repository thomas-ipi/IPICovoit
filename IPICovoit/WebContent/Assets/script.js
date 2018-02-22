function inscription()
{
	$('body').append('<div class="container containerInscription"><div class="blocInscription"><form method="post" class="form-group" action=""><center><h1>Inscription<input value="X" style="max-width:40px;margin-left:10%;margin-top:-10px" class="btn btn-danger" onclick="closeInscription()"/></h1></center><hr/><br><div class="row" style="margin-left:0px;margin-right:0px"><input type="text" class="form-control col-md-6" placeholder="Nom"/><input type="text" class="form-control col-md-6" placeholder="Prénom"/></div><br><input type="tel" class="form-control" placeholder="Téléphone"/><br><input type="email" class="form-control" placeholder="Mail"/><br><input type="text" class="form-control" placeholder="Classe"/><br><input type="password" class="form-control" placeholder="Mot de Passe"/><br><input type="password" class="form-control" placeholder="Confirmer le mot de passe"/><br><center><input type="submit" class="btn" value="Valider"/></center></form></div></div>');
}

function closeInscription()
{
	$('.containerInscription').empty();
}