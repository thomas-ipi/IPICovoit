<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:if test = "${successMessage != null}">
	<div class="alert alert-success alert-dismissible fade show">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Bravo!</strong> ${successMessage}
	</div>
</c:if>
<c:if test = "${infoMessage != null}">
	<div class="alert alert-info alert-dismissible fade show">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Info!</strong> ${infoMessage}
	</div>
</c:if>
<c:if test = "${warningMessage != null}">
	<div class="alert alert-warning alert-dismissible fade show">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Warning!</strong> ${warningMessage}
	</div>
</c:if>
<c:if test = "${errorMessage != null}">
	<div class="alert alert-danger alert-dismissable">
	    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
	    <strong>Danger!</strong> ${errorMessage}
  	</div>
</c:if>