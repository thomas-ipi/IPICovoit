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
</head>
<body>


<nav class="navbar navbar-dark bg-dark justify-content-between" style="z-index: 50">
  <span class="navbar-brand" style="color: white; margin-left:20%">IPI'Covoit</span>
	<c:choose>
		<c:when test = "${nom == null}">
			<form class="form-inline" style="margin-left:27%" method="post" action="login">
				<span class="navbar-nav" style="width:150px;color:white">Se connecter : </span>
				<input class="form-control mr-sm-2" type="text" placeholder="Identifiant" name="id" style="width:150px">
				<input class="form-control mr-sm-2" type="password" placeholder="Mot de passe" name="mdp" style="width:150px">
		  		<button class="btn btn-danger my-2 my-sm-0" type="submit">Valider</button>
			</form>
			<span class="navbar-nav" style="color:white;text-decoration:underline;cursor:pointer" onclick="inscription()">Pas encore inscrit ?</span>
		</c:when>
		<c:when test = "${nom != null}">
			<form class="form-inline" style="margin-left:27%" method="post" action="logout">
				<span class="navbar-nav" style="width:150px;color:white">Bienvenue à toi ${prenom}</span>
				<button class="btn btn-danger my-2 my-sm-0" type="submit">Deconnexion</button>
			</form>
		</c:when>
	</c:choose>
</nav>

<div class="container-fluid">
	<div class="row">
	<div style="width: 20%; z-index: 100">
		<div class="" style="text-align: center; z-index: 100;">
			<img class="" src="images/logo-ipi.png" title="super logo" style="background-color:white; padding: 20px 40px; width: 50%; border-radius: 4px; margin-top: 20px;" />
		</div>
		
		<div style="margin-top: 90px;">
			<div class="card" style="width: 90%; margin: auto">
				 <div class="card-header"><b>Je vais au campus</b></div>
				 <div class="card-body">
				 <div>
					  <div class="form-group">
						    <label for="exampleInputEmail1">Mon adresse</label>
						    <input type="text" id="adresse_maison_campus" name="adresse_maison_campus" class="form-control" placeholder="Renseigne ton adresse">
					  </div>
					  <button id="direction_campus" type="button" class="btn btn-outline-danger" style="float: right">Go</button>
				</div>
				 </div>
			</div>
		</div>
		<div style="margin-top: 30px;">
			<div class="card" style="width: 90%; margin: auto">
				 <div class="card-header"><b>Je rentre chez moi</b></div>
				 <div class="card-body">
					<div id="direction_maison">
					  <div class="form-group">
						    <label for="exampleInputEmail1">Mon adresse</label>
						    <input type="text" id="adresse_campus_maison" name="adresse_campus_maison" class="form-control" placeholder="Renseigne ton adresse">
					  </div>
					  <button type="button" class="btn btn-outline-danger" style="float: right">Go</button>
					</div>
				 </div>
			</div>
		</div>

		
	</div>
	
	<div class="nav" style="z-index: 0">
	</div>	
	
	<div class="nav2" style="z-index: 0">
		<div class="maps"><c:import url="maps.jsp"/></div>
	</div>
	
	</div>
	
</div>


</body>
</html>