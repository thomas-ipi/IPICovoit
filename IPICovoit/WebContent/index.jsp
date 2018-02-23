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
		
		<!--<div style="margin-top: 90px;">
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
		</div>  -->
		
		
		
		<div style="margin-top: 90px;">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
		  <li class="nav-item">
		    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" style="color: black"><b>Passager</b></a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" style="color: black"><b>Conducteur</b></a>
		  </li>
		</ul>
		
		<div class="tab-content" id="myTabContent" style="background-color: white; padding: 30px 20px;"> 
		  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
		  	<div>
				  <div class="form-group">
				  <i class="fas fa-map-marker"></i>
					    <label for="exampleInputEmail1">Mon adresse</label>
					    <input type="text" id="adresse_maison_campus" name="adresse_maison_campus" class="form-control" placeholder="Renseigne ton adresse">
				  </div>
				  <i class="fas fa-arrows-alt-h"></i>
				  <span>Aller/Retour :</span>
				  
				  <br /><div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
					  <label class="form-check-label" for="inlineRadio1">Aller</label>
				  </div>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">Retour</label>
				  </div>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">Aller & Retour</label>
				  </div>
				  <br />
				  <br />
				  <img src="images/cigarette.png" /> 
				  <span>Fumeur/Non-fumer :</span>
				  <br/>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
					  <label class="form-check-label" for="inlineRadio1">Fumeur</label>
				  </div>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">Non-fumeur</label>
				  </div>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">Peu importe</label>
				  </div>
				  <br/>
				  <br/>
				  <div class="form-group">
				  <i class="fas fa-calendar-alt"></i>
				    <label for="prenom">Date :</label>
				    <input type="text" class="form-control" id="date_trajet" name="date_trajet">
			  	  </div>
				  

				  <button id="direction_campus" type="button" class="btn btn-outline-danger" style="float: right">Go</button>
				  <br/>
			</div>
		  </div>
		  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
		  	test
		  	test
		  </div>
		</div>
		</div>



	</div>
	
	<div class="nav1" style="z-index: 0">
	</div>	
	
	<div class="nav2" style="z-index: 0">
		<div class="maps"><c:import url="maps.jsp"/></div>
	</div>
	
	</div>
	
</div>
<c:import url="/WEB-INF/SignIN/modalSignIn.jsp" />
<c:import url="/WEB-INF/alert/alertBootstrap.jsp" />
<script>
$( function() {
  $( "#date_trajet" ).datepicker();
} );
</script>


<c:import url="/WEB-INF/Shared/footer.jsp" />

</body>
</html>