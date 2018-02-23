<div class="container containerInscription">
	<div class="blocInscription">
		<form method="post" class="form-group" onsubmit="return verifInscription()" action="signIn">
			<center>
				<h2>Inscription
				<input value="X" style="max-width:40px;margin-left:10%;margin-top:-10px" class="btn btn-danger"/></h2>
			</center>
			<hr/><br>
			<div class="row" style="margin-left:0px;margin-right:0px">
				<input type="text" class="form-control col-md-6" id="nomInscription" placeholder="Nom" name="nomSign"/>
				<input type="text" class="form-control col-md-6" id="prenomInscription" placeholder="Prénom" name="prenomSign"/>
			</div>
			<br>
			<input type="tel" class="form-control"  id="telInscription" placeholder="Téléphone" name="phoneSign"/><br>
			<input type="email" class="form-control"  id="mailInscription" placeholder="Mail" name="mailSign"/><br>
			<input type="password" class="form-control"  id="mdp1Inscription" placeholder="Mot de Passe" name="mdpSign"/><br>
			<input type="password" class="form-control"  id="mdp2Inscription" placeholder="Confirmer le mot de passe"/><br>
			<center>
				<input type="submit" class="btn btn-danger" value="Valider"/>
			</center>
		</form>
	</div>
</div> 