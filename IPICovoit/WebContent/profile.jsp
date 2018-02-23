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
<br>

<c:import url="/WEB-INF/alert/alertBootstrap.jsp" />