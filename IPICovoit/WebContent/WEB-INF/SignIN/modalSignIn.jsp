<div class="container containerInscription">
	<div class="blocInscription">
		<form method="post" class="form-group" onsubmit="return verifInscription()" action="signIn">
			<center>
				<h2>Inscription
				<input type="button" value="X" style="max-width:40px;margin-left:10%;margin-top:-10px" class="btn btn-danger" onclick="closeInscription()"/></h2>
			</center>
			<hr/><br>
			<div class="row">
			    <div class="col">
			      <input type="text" class="form-control" id="nomInscription" name="prenom" placeholder="Prénom">
			    </div>
			    <div class="col">
			      <input type="text" class="form-control" id="prenomInscription" name="nom" placeholder="Nom">
				</div>
			</div>
			<small id="nameHelp" class="form-text" style="font-size:0.7vw;color:white;display:none">*2 caractères minimum</small><br>
			<input type="tel" class="form-control"  id="telInscription" placeholder="Téléphone*" name="phone"/>
			<small id="telHelp" class="form-text" style="font-size:0.7vw;color:white;display:none">*Chiffres seulement et 10 caractères</small><br>
			<input type="email" class="form-control"  id="mailInscription" placeholder="Mail*" name="mail"/>
			<small id="mailHelp" class="form-text" style="font-size:0.7vw;color:white;display:none">*L'extension mail doit être '@campus-igs-toulouse.fr'</small><br>
			<input type="password" class="form-control"  id="mdp1Inscription" placeholder="Mot de Passe*" name="mdp"/><br>
			<input type="password" class="form-control"  id="mdp2Inscription" placeholder="Confirmer le mot de passe"/>
			<small id="mdpHelp1" class="form-text" style="font-size:0.7vw;color:white;display:none">*5 caractères minimum</small>
			<small id="mdpHelp2" class="form-text" style="font-size:0.7vw;color:white;display:none">*Les mots de passe doivent être identiques</small><br>
			<center>
				<input type="submit" class="btn btn-danger" value="Valider"/>
			</center>
		</form>
	</div>
</div> 