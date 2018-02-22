<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IPICovoit</title>
<link href="style.css" rel=stylesheet type="text/css">
<link href="Framework/bootstrap/css/bootstrap.min.css" rel=stylesheet type="text/css">
<script type="text/javascript" src="Framework/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="Framework/jquery-3.3.1.min.js"></script>
</head>
<body>


<nav class="navbar navbar-dark bg-dark justify-content-between" style="z-index: 50">
  <span class="navbar-brand" style="color: white; margin-left:20%">IPI'Covoit</span>
  <form class="form-inline" style="margin-left:27%" method="post" action="login">
  	<span class="navbar-nav" style="width:150px;color:white">Se connecter : </span>
    <input class="form-control mr-sm-2" type="text" placeholder="Identifiant" style="width:150px">
    <input class="form-control mr-sm-2" type="password" placeholder="Mot de passe" style="width:150px">
    <button class="btn btn-danger my-2 my-sm-0" type="submit">Valider</button>
  </form>
  <span class="navbar-nav" style="color:white;text-decoration:underline;cursor:pointer" onclick="">Pas encore inscrit ?</span>
</nav>

<div class="nav">
	<div class="logoBg"><img class="logoIpi" src="images/logo-ipi.png" title="super logo"/></div>
	<div class="searchTrajet">BLABLABLABLAAAAAAAAAAAA AAAAAAAAAAAAAAA AAAAAAAAAA AAAAAAAAAAa</div>
</div>

<div class="maps"><c:import url="maps.jsp"/></div>


</body>
</html>