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
<script type="text/javascript" src="Framework/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Assets/script.js"></script>
<link rel="stylesheet"
href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>	
<body>
<!-- nav class="navbar navbar-dark bg-dark justify-content-between" style="z-index: 50">
  <span class="navbar-brand" style="color: white; margin-left:20%"><a href="/IPICovoit/"><i class="fas fa-home"></i> Accueil</a></span>
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
				<a class="ico-profile" href="/IPICovoit/profile.jsp">
					<i class="fas fa-user-circle"></i>
					<span class="navbar-nav" style="width:150px;color:white">Bienvenue à toi ${prenom}</span>
				</a>
				<button class="btn btn-danger my-2 my-sm-0" type="submit">Deconnexion</button>
			</form>
		</c:when>
	</c:choose>
</nav-->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/IPICovoit/"><i class="fas fa-home"></i> Accueil</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <c:choose>
		<c:when test = "${nom == null}">
      <form class="form-inline my-2 my-lg-0 ml-auto" method="post" action="login">
            <input class="form-control mr-sm-2" type="text" placeholder="Adresse mail" name="id" style="width:150px">
			<input class="form-control mr-sm-2" type="password" placeholder="Mot de passe" name="mdp" style="width:150px">
		<button class="btn btn-danger my-2 my-sm-0" type="submit">Valider</button>
      </form>
      <ul class="navbar-nav">
          <li class="nav-item">
                <span class="navbar-nav" onclick="inscription()">Pas encore inscrit ?</span>
          </li>
      </ul>
      	</c:when>
		<c:when test = "${nom != null}"> 
		
			<form class="form-inline ml-auto" style="margin-left:27%" method="post" action="logout">
				<a class="ico-profile" href="/IPICovoit/profile.jsp">
					<i class="fas fa-user-circle"></i>
					<span class="navbar-nav" id="spanAccountConnected" style="width:150px;color:white">Bienvenue à toi ${prenom}</span>
				</a>
				<button class="btn btn-danger my-2 my-sm-0" type="submit">Deconnexion</button>
			</form>
		</c:when>
	</c:choose>
    </div>
</nav>

