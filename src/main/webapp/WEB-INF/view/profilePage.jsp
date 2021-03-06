<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Profile</title>
    <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet" />
    <script src="/js/script.js" type="text/javascript"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm sticky-top navbar-dark bg-primary">
      <a class="navbar-brand" href="#">
      	<img src="/images/school.png" width="30" height="30" class="d-inline-block align-top mr-2" alt="img">SpringBootApp
      </a>
      <ul class="navbar-nav ml-auto">
      	<li class="nav-item mr-4 px-2">
        	<a class="nav-link text-white" href="home">Home</a>
        </li>
      	<li class="nav-item mr-4 px-2">
        	<a class="nav-link text-white current-page" href="profile">Profile</a>
        </li>
        <li class="nav-item mr-4 px-2">
        	<a class="nav-link text-white" href="contact">Contact Us</a>
        </li>
        <li class="nav-item mr-4 px-2">
        	<a class="nav-link text-white" href="about">About Us</a>
        </li>
       	<li class="nav-item mr-4 px-2">
        	<a class="nav-link text-white" href="logout">LogOut</a>
        </li>
      </ul>
     </nav>
     
     <section class="shadow card mx-auto register-card">
    	<h5 class="card-header secondary-color text-center">Enter Student Detail</h5>
    	<div class="card-body px-lg-5 pt-0">
    		<form:form method="post" action="profile" modelAttribute="student"> <br>
    			<div class="d-block form-group">
    				<form:label path="id" class="control-label">Student Id</form:label>
    				<form:input path="id" class="form-control" placeholder="Enter Id" readonly="readonly"/>
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
    			<div class="d-inline-block form-group input-field float-right">
    				<form:label path="city" class="control-label">City</form:label>
    				<form:input path="city" class="form-control" placeholder="Enter City" required="required"/>
    				<form:errors path="city" cssStyle="color:red;"/>
    			</div>  <br/>
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
    				<button type="submit" class="btn btn-dark">Update</button>
    			</div>
    		</form:form>
    	</div>
    </section>
     
</body>
</html>