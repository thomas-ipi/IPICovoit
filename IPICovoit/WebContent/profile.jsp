<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IPICovoit</title>
<link href="Assets/style.css" rel=stylesheet type="text/css">
<link href="Assets/fontawesome-all.min.css" rel=stylesheet type="text/css">
<link href="Framework/bootstrap/css/bootstrap.min.css" rel=stylesheet type="text/css">
<script type="text/javascript" src="Framework/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="Assets/script.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
 </script>
</head>
<body>


<nav class="navbar navbar-dark bg-dark justify-content-between" style="z-index: 50">
  <span class="navbar-brand" style="color: white; margin-left:20%">IPI'Covoit</span>
  <form class="form-inline" style="margin-left:27%" method="post" action="logout">
		<span class="navbar-nav" style="width:150px;color:white">Bienvenue à toi ${prenom}</span>
		<button class="btn btn-danger my-2 my-sm-0" type="submit">Deconnexion</button>
  </form>
</nav>
<br/>
<br/>
<div class="card" style="width: 80%; margin: auto">
  <div class="card-header">
    MON PROFILS
  </div>
  <div class="card-body">
  <form>
    <div class="form-group">
	    <label for="nom">Nom :</label>
	    <input type="text" class="form-control" id="nom" value="recup nom">
    </div>
  	<div class="form-group">
	    <label for="prenom">Prénom :</label>
	    <input type="text" class="form-control" id="prenom" value="recup prenom">
  	</div>
  	<fieldset disabled>
  	<div class="form-group">
      <label>E-mail :</label>
      <input type="text" class="form-control" value="recup mail">
	    <small id="emailHelp" class="form-text text-muted">Tu ne peux pas modifier ton adresse mail.</small>
    </div>
  	</fieldset>
  	<div class="form-group">
	    <label for="adresse">Adresse :</label>
	    <input type="text" class="form-control" id="adresse" value="recup adresse">
  	</div>
  	<br />
  	<a href="#" class="btn btn-outline-dark" style="float: right">Modifier mon profil</a>
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
  	<a href="#" class="btn btn-outline-dark" style="float: right">Modifier mon trajet</a>
  </form>
  </div>
</div>

</body>
</html>