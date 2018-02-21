<form method="post" action="login">
    <fieldset>
        <legend>Connexion</legend>
        <p>Vous pouvez vous connecter via ce formulaire</p>

        <label for="nom">Adresse email <span class="requis">*</span></label>
        <input type="email" name="email" value="${form.email}" size="20" maxlength="60"/>
        <span class="erreur">${error['email']}</span>
        <br/>

        <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
        <input type="password" name="pwd" value="" size="20" maxlength="20"/>
        <span class="erreur">${error['motdepasse']}</span>
        <br/>

        <input type="submit" value="Connexion" class="sansLabel"/>
        <br/>
        
        <p class="${statusOK ? 'succes' : 'erreur'}">${statusMessage}</p>
    </fieldset>
</form>