<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/Shared/header.jsp" />

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
<c:import url="/WEB-INF/SignIN/modalSignIn.jsp" />
<c:import url="/WEB-INF/alert/alertBootstrap.jsp" />

<c:import url="/WEB-INF/Shared/footer.jsp" />

</body>
</html>