<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
 </script>

<c:import url="/WEB-INF/Shared/header.jsp" />
<br/>
<div class="card" style="width: 80%; margin: auto">
  <div class="card-header">
    MON PROFIL
  </div>
  <div class="card-body">
  <form method="post" action="editProfile">
    <div class="form-group">
	    <label for="nom">Nom :</label>
	    <input type="text" class="form-control" id="nom" name="nomProfile" value="${nom}">
    </div>
  	<div class="form-group">
	    <label for="prenom">Prénom :</label>
	    <input type="text" class="form-control" id="prenom" name="prenomProfile" value="${prenom}">
  	</div>
  	<fieldset disabled>
  	<div class="form-group">
      <label>E-mail :</label>
      <input type="text" class="form-control" value="${mail}">
	    <small id="emailHelp" class="form-text text-muted">Tu ne peux pas modifier ton adresse mail.</small>
    </div>
  	</fieldset>
  	<div class="form-group">
	    <label for="adresse">Adresse :</label>
	    <input type="text" class="form-control" id="adresse" name="adresseProfile" value="${adresse}">
  	</div>
  	<div class="form-group">
	    <label for="adresse">Téléphone :</label>
	    <input type="text" class="form-control" id="adresse" name="telephoneProfile" value="${telephone}">
  	</div>
  	<br />
  	<button class="btn btn-outline-dark" type="submit">Modifier mon profil</button>
  </form>
  </div>
</div>

<div class="card" style="width: 80%; margin: auto">
  <div class="card-header">
    MON TRAJET EN TANT QUE CONDUCTEUR
  </div>
  <div class="card-body">
  <form> 
  <div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="aller_retour" id="inlineRadio1" value="aller">
	  <label class="form-check-label">Aller</label>
	</div>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="aller_retour" id="inlineRadio2" value="retour">
	  <label class="form-check-label">Retour</label>
	</div>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="aller_retour" id="inlineRadio3" value="aller_retour">
	  <label class="form-check-label">Aller & Retour</label>
	</div>
	<br/> 
	<br />
    <div class="form-group">
	    <label for="nom">Nombre de place :</label>
	    <input type="text" class="form-control" id="nom" value="recup nombre place">
    </div>
  	<div class="form-group">
	    <label for="prenom">Date :</label>
	    <input type="text" class="form-control" id="datepicker" name="datepicker" value="recup date">
  	</div>
  	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="fumeur" id="fumeurO" value="1">
	  <label class="form-check-label">Fumeur</label>
	</div>
	<div class="form-check form-check-inline">
	  <input class="form-check-input" type="radio" name="fumeur" id="fumerN" value="0">
	  <label class="form-check-label">Non-fumeur</label>
	</div>
  	<br />
  	<a href="#" class="btn btn-outline-dark" type="submit" style="float: right">Modifier mon trajet</a>
  </form>
  </div>
</div>

<c:import url="/WEB-INF/Shared/footer.jsp" />
<c:import url="/WEB-INF/alert/alertBootstrap.jsp" />