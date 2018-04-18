<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/Shared/header.jsp" />
<div class="container-fluid">
	<div class="row">
	<div class="nav1">
		<!-- <div class="" style="text-align: center; z-index: 100;">
			<img class="" src="images/Logo-IPIcovoit-couleur.png" title="super logo" style="background-color:white; padding: 20px 40px; width: 50%; border-radius: 4px; margin-top: 20px;" />
		</div> -->
		<div id="img_logo_ipi_covoit">
			<img class="logo_img" src="images/Logo-IPIcovoit-blanc.png" />
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
		
		
		
		<div style="margin-top: 5em;">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
		  <li class="nav-item" style="width:50%">
		    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" style="color: white">
		    <i class="fas fa-user"></i><b> Passager</b>
		    </a>
		  </li>
		  <li class="nav-item" style="width:50%">
		    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" style="color: white">
		    <i class="fas fa-car"></i><b> Conducteur</b>
		    </a>
		  </li>
		</ul>
		
		<div class="tab-content" id="myTabContent" style="background-color: white; padding: 30px 20px;"> 
		  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
		  	<div>
				  <div class="form-group">
				  <i class="fas fa-map-marker"></i>
					    <label for="exampleInputEmail1">Mon adresse</label>
					    <input type="text" id="adresse_passager" name="adresse_maison_campus" class="form-control" placeholder="Renseigne ton adresse">
				  </div>
				  <i class="fas fa-arrows-alt-h"></i> 
				  <span>Aller/Retour :</span>
				  
				  <br /><div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="ar" id="inlineRadio1" value="option1">
					  <label class="form-check-label" for="inlineRadio1">Aller</label>
				  </div>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="ar" id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">Retour</label>
				  </div>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name=ar id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">Aller & Retour</label>
				  </div>
				  <br />
				  <br /> 
				  <img src="images/cigarette.png" /> 
				  <span>Fumeur/Non-fumeur :</span>
				  <br/>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="f" id="inlineRadio1" value="option1">
					  <label class="form-check-label" for="inlineRadio1">Fumeur</label>
				  </div>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="f" id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">Non-fumeur</label>
				  </div>
				  <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="f" id="inlineRadio2" value="option2">
					  <label class="form-check-label" for="inlineRadio2">Peu importe</label>
				  </div>
				  <br/>
				  <br/>
				  <div class="form-group">
				  <i class="fas fa-calendar-alt"></i>
				    <label for="prenom">Date :</label>
				    <input type="text" class="form-control date_trajet" id="" name="date_trajet">
			  	  </div>
				  

				  <button id="direction_campus" type="button" class="btn btn-outline-danger" style="float: right">Go</button>
				  <br/>
			</div>
		  </div>
		  <!-- CONDUCTEUR -->
		  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
		  	<div>
		  		<form method='POST' action='addTraject' id="form_conducteur" onsubmit="return verifTrajet()">
					  <div class="form-group">
					  <i class="fas fa-map-marker"></i>
						    <label for="exampleInputEmail1">Mon adresse</label>
						    <div class="row">
							    <input type="text" id="adresse_conducteur" name="adresse_maison_campus" class="form-control col-8 ml-2" placeholder="Renseigne ton adresse" required>
							    <button type="button" class="btn col-3 ml-2" id="button_search_conducteur"><i class="fas fa-search"></i> Vérifier</button>
							    <input type="hidden" name="value_lat_search_conducteur" value="" id="value_lat_search_conducteur" />
							    <input type="hidden" name="value_lng_search_conducteur" value="" id="value_lng_search_conducteur" />
						    </div>
					  </div>
					  <i class="fas fa-arrows-alt-h"></i>
					  <span>Aller/Retour :</span>
					  
					  <br />
					  <div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="ar" id="inlineRadio1" value="aller" checked>
						  <label class="form-check-label" for="inlineRadio1">Aller</label>
					  </div>
					  <div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="ar" id="inlineRadio2" value="retour">
						  <label class="form-check-label" for="inlineRadio2">Retour</label>
					  </div>
					  <div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="ar" id="inlineRadio3" value="twice">
						  <label class="form-check-label" for="inlineRadio3">Aller & Retour</label>
					  </div>
					  <br />
					  <br />
					  <img src="images/cigarette.png" /> 
					  <span>Fumeur/Non-fumeur :</span>
					  <br/>
					  <div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="smoke" id="inlineRadio1" value="fumeur">
						  <label class="form-check-label" for="inlineRadio1">Fumeur</label>
					  </div>
					  <div class="form-check form-check-inline">
						  <input class="form-check-input" type="radio" name="smoke" id="inlineRadio2" value="nonFumeur" checked>
						  <label class="form-check-label" for="inlineRadio2">Non-fumeur</label>
					  </div>
					  <br/>
					  <br/>
					  <div class="form-group">
					  <i class="fas fa-calendar-alt"></i>
					    <span>Du </span>
					    <input type="text" class="form-control date_trajet" id="" name="date_trajet_begin" required>
					    <span> au </span>
					    <input type="text" class="form-control date_trajet" id="" name="date_trajet_end" required>
				  	  </div>
				  	  
					  <button id="direction_campus2" type="submit" class="btn btn-outline-danger" style="float: right">Go</button>
					  <br/>
				  </form>
			</div>
		  </div>
		</div>
		</div>



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
  $( ".date_trajet" ).datepicker();
} );
</script>


<c:import url="/WEB-INF/Shared/footer.jsp" />

</body>
</html>