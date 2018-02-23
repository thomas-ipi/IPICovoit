<div class="container containerInscription">
	<div class="blocInscription">
		<form method="post" class="form-group" action="signIn">
			<center>
				<h2>Inscription
				<input value="X" style="max-width:40px;margin-left:10%;margin-top:-10px" class="btn btn-danger" onclick="closeInscription()"/></h2>
			</center>
			<hr/><br>
			<div class="row" style="margin-left:0px;margin-right:0px">
				<input type="text" class="form-control col-md-6" id="nomInscription" placeholder="Nom" name="nom"/>
				<input type="text" class="form-control col-md-6" id="prenomInscription" placeholder="Prénom" name="prenom"/>
			</div>
			<br>
			<input type="tel" class="form-control"  id="telInscription" placeholder="Téléphone" name="phone"/><br>
			<input type="email" class="form-control"  id="mailInscription" placeholder="Mail" name="mail"/><br>
			<input type="password" class="form-control"  id="mdp1Inscription" placeholder="Mot de Passe" name="mdp"/><br>
			<input type="password" class="form-control"  id="mdp2Inscription" placeholder="Confirmer le mot de passe"/><br>
			<center>
				<input onclick="verifInscription()" type="submit" class="btn btn-danger" value="Valider"/>
			</center>
		</form>
	</div>
</div>