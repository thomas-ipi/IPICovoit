<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/WEB-INF/Shared/header.jsp" />

<div class="container-fluid">
	<div class="row">
		<div class="col-xl-2 col-lg-4 col-12" style="padding: 0">
        	<div id="div-logo-ipi-covoit">
            	<img id="logo-ipi-covoit" src="images/Logo-IPIcovoit-blanc.png" />
        </div>
      <div style="background-color: #F22B29">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
		  <li class="nav-item" style="width:50%; text-align: center" id="box-passager">
		    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true" style="color: white">
		    <i class="fas fa-user"></i><b><br />Passager</b>
		    </a>
		  </li>
		  <li class="nav-item" style="width:50%; text-align: center">
		    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" style="color: white">
		    <i class="fas fa-car"></i><b><br />Conducteur</b>
		    </a>
		  </li>
		</ul> 		
		<div class="tab-content" id="myTabContent" style="background-color: white; padding: 30px 20px;"> 
		  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
		  	<form method='POST' action='getTraject' id="form_passager" onsubmit="">
                <!-- PASSAGER -->
                <div class="tab-pane fade show active" id="passager" role="tabpanel" aria-labelledby="passager-tab">
                    <div>
                        <!-- ADRESSE -->
                        <div class="form-group">
                            <i class="fas fa-map-marker"></i>
                            <label for="adresse_maison_campus">Mon adresse</label>
                            <input type="text" id="adresse_passager" name="adresse_maison_campus" class="form-control" placeholder="Renseigne ton adresse" required>
                        	<span id="passagerAdresseSpan" style="color:red;display:none">Merci de remplir votre adresse</span>
                        </div>

                        <!-- ALLER RETOUR -->
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
                            <input class="form-check-input" type="radio" name=ar id="inlineRadio3" value="Aller_Retour">
                            <label class="form-check-label" for="inlineRadio3">Aller & Retour</label>
                        </div>
                        <br />
                        <br />

                        <!-- FUMEUR -->
                        <img src="images/cigarette.png" /> 
                        <span>Fumeur/Non-fumeur :</span>
                        <br/>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="f" id="inlineRadio4" value="fumeur">
                            <label class="form-check-label" for="inlineRadio4" value="fumeur">Fumeur</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="f" id="inlineRadio5" value="nonFumeur" checked>
                            <label class="form-check-label" for="inlineRadio5" value="nonFumeur">Non-fumeur</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="f" id="inlineRadio6" value="Peu_importe">
                            <label class="form-check-label" for="inlineRadio6" value="Peu_importe">Peu importe</label>
                        </div>
                        <br/>
                        <br/>
 
                        <!-- DATE -->
                        <div class="form-group">
                            <i class="fas fa-calendar-alt"></i>
                            <label for="prenom">Date :</label>
                            <input type="text" class="form-control date_trajet" id="datePickerPassager" name="date_trajet" required>
                        	<span id="passagerDateSpan" style="color:red;display:none">Merci de choisir une date !</span>
                        </div>

                        <!-- SUBMIT FORM -->
                        <button id="submit_passager" type="button" class="btn btn-outline-danger" onclick="getTrajects()" style="float: right">Go</button><!-- direction camus en id avant -->
                        <br/>
                    </div>
                </div>
            </form>
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
							    <button type="button" class="btn col-3 ml-2" id="button_search_conducteur">Vérifier</button>
							    <input type="hidden" name="value_lat_search_conducteur" value="" id="value_lat_search_conducteur" />
							    <input type="hidden" name="value_lng_search_conducteur" value="" id="value_lng_search_conducteur" />
						    </div>
						    <div id="verifConducteurMessage" style="color:red;display:none">Merci de vérifier l'adresse !</div>
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
        <div class="col-xl-10 col-lg-8 col-12" style="object-fit: cover; padding: 0; position: inherit; height: calc(100vh - 56px)">
                <div style="height: 88%">
                    <div id="my_google_maps" style="height: 100%; width: 100%">
                    </div>
                    
					<c:import url="maps.jsp"/>
					
                </div>
                <div style="height: 12%; background-color: #343a40; padding: 10px 10px 0 10px"> 
                    <c:import url="/WEB-INF/Shared/footer.jsp" />
                </div>
            </div>
	</div>
</div>



<c:import url="/WEB-INF/SignIN/modalSignIn.jsp" />
<c:import url="/WEB-INF/alert/alertBootstrap.jsp" />
<script>
$( function() {
  $( ".date_trajet" ).datepicker({
	  closeText: 'Fermer',
	  prevText: 'Précédent',
	  nextText: 'Suivant',
	  currentText: 'Aujourd\'hui',
	  monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
	  monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
	  dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
	  dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
	  dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
	  weekHeader: 'Sem.',
	  dateFormat: 'dd-mm-yy'
	});
});
</script>




</body>
</html>