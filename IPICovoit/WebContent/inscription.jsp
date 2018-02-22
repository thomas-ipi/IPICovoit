<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IPICovoit - Inscription</title>
<link href="Framework/bootstrap/css/bootstrap.min.css" rel=stylesheet type="text/css">
<link href="style.css" rel=stylesheet type="text/css">
<script type="text/javascript" src="Framework/jquery-3.3.1.min.js"></script>	
</head>
<body>

<div class="container blocInscription">
	<form method="post" class="form-group" action="">
		<center>
			<h1>Inscription</h1><hr/><br>
			<input type="text" class="form-control" placeholder="Nom"/><br>
			<input type="text" class="form-control" placeholder="Prénom"/><br>
			<input type="tel" class="form-control" placeholder="Téléphone"/><br>
			<input type="email" class="form-control" placeholder="Mail"/><br>
			<input type="text" class="form-control" placeholder="Classe"/><br>
			<input type="password" class="form-control" placeholder="Mot de Passe"/><br>
			<input type="submit" class="btn" value="Valider"/>
		</center>
	</form>
</div>

</body>
</html>