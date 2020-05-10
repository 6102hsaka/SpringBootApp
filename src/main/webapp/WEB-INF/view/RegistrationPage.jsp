<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Register</title>
	<link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="/js/script.js" type="text/javascript"></script>
    <script type="text/javascript">
	$(document).ready(function(){
	$('#comboboxCountry').on('change', function(){
		var countryId = $(this).val();
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/loadStatesByCountry/' + countryId,
			success: function(result) {
				var result = JSON.parse(result);
				var s = '';
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
				}
				$('#comboboxState').html(s);
			}
		});
	});

	$('#comboboxState').on('change', function(){
		var stateId = $(this).val();
		$.ajax({
			type: 'GET',
			url: '${pageContext.request.contextPath }/loadCitiesByState/' + stateId,
			success: function(result) {
				var result = JSON.parse(result);
				var s = '';
				for(var i = 0; i < result.length; i++) {
					s += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
				}
				$('#comboboxCity').html(s);
			}
		});
	});
});
</script>
</head>
<body>

	<nav class="navbar navbar-expand-sm navbar-dark bg-primary">
      <a class="navbar-brand" href="#">SpringBootApp</a>
      <ul class="navbar-nav ml-auto">
       	<li class="nav-item mr-2">
        	<a class="nav-link text-white" href="login">LogIn</a>
        </li>
      </ul>
    </nav>
   
    <p class="text-center err-msg" id="err-p">
		<c:if test="${RegistrationErr==true}">
			<c:out value="Unable to Register Student" />
		</c:if>
	</p>
    
    <section class="shadow card mx-auto register-card">
    	<h5 class="card-header secondary-color text-center">Enter Student Detail</h5>
    	<div class="card-body px-lg-5 pt-0">
    		<form:form method="post" action="register" modelAttribute="student"> <br>
    			<div class="d-block form-group">
    				<form:label path="id" class="control-label">Student Id</form:label>
    				<form:input path="id" class="form-control" placeholder="Enter Id" required="required"/>
    				<form:errors path="id" cssStyle="color:red;"/>
    			</div>
    			<div class="d-inline-block form-group input-field">
    				<form:label path="fname" class="control-label">First Name</form:label>
    				<form:input path="fname" class="form-control" placeholder="Enter First Name" required="required"/>
    				<form:errors path="fname" cssStyle="color:red;"/>
    			</div>
    			<div class="d-inline-block form-group input-field float-right">
    				<form:label path="lname" class="control-label">Last Name</form:label>
    				<form:input path="lname" class="form-control" placeholder="Enter Last Name" required="required"/>
    				<form:errors path="lname" cssStyle="color:red;"/>
    			</div> <br/>
    			<div class="d-inline-block form-group input-field">
    				<form:label path="age" class="control-label">Age</form:label>
    				<form:input path="age" class="form-control" placeholder="Enter Age" required="required"/>
    				<form:errors path="age" cssStyle="color:red;"/>
    			</div>
    			<div class="d-block form-group input-field float-right">
    				<form:label path="gender" class="control-label">Gender</form:label><br/>
    				<form:radiobutton path="gender" value="Male"/>Male
    				<form:radiobutton path="gender" value="Female"/>Female
    				<form:errors path="gender" cssStyle="color:red;"/>
    			</div>  <br/>
    			 
    			<div class="form-group input-field ">
    				<form:label path="city" class="control-label">City</form:label>
    				<form:select path="country" id="comboboxCountry">
    					<form:option value="NONE">--SELECT COUNTRY--</form:option>
    					<c:forEach items="${countryList}" var="country">
    						<form:option value="${country.id}">${country.name}</form:option>
    					</c:forEach>
    				</form:select> <br/>
    				<form:select path="state" id="comboboxState">
    					<form:option value="NONE">--SELECT STATE--</form:option>
    				</form:select> <br/>
    				<form:select path="city" id="comboboxCity">
    					<form:option value="NONE">--SELECT CITY--</form:option>
    				</form:select> <br/>
    				<form:errors path="city" cssStyle="color:red;"/>
    			</div>  
    			
    			<div class="d-inline-block form-group input-field">
    				<form:label path="pass" class="control-label">Password</form:label>
    				<form:password path="pass" class="form-control" placeholder="Enter Password" id="pass" required="required"/>
    				<form:errors path="pass" cssStyle="color:red;"/>
    			</div>
    			<div class="d-inline-block form-group input-field float-right">
    				<form:label path="confirmPass" class="control-label">Confirm Password</form:label>
    				<form:password path="confirmPass" class="form-control" placeholder="Re-Enter Password" 
    					id="confirm" onchange="validConfirmPass()" required="required"/>
    				<form:errors path="confirmPass" cssStyle="color:red;"/>
    			</div>  <br/>
    			<div class="d-block form-group float-right">
    				<button type="submit" class="btn btn-dark">Register</button>
    			</div>
    		</form:form>
    	</div>
    </section>

</body>
</html>