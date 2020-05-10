<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/custom.css" rel="stylesheet" />
</head>
<body>

	<nav class="navbar navbar-expand-sm navbar-dark bg-primary">
      <a class="navbar-brand" href="#">SpringBootApp</a>
    </nav>
	<p class="text-center err-msg">
		<c:if test="${loginErr==true}">
			<c:out value="Invalid credential" />
		</c:if>
	</p>
	
    <section class="shadow card mx-auto login-card" >
    	<h5 class="card-header secondary-color text-center">Enter Student Detail</h5>
    	<div class="card-body px-lg-5 pt-0">
    		<form:form method="post" action="login" modelAttribute="student"> <br>
    			<div class="form-group">
    				<form:label path="id" class="control-label">Student Id</form:label>
    				<form:input path="id" class="form-control" name="userid" placeholder="Enter Student Id" required="required"/>
    				<form:errors path="id"></form:errors>
    			</div>
    			<div class="form-group">
    				<form:label path="pass" class="control-label">Student Password</form:label>
    				<form:password path="pass" class="form-control" name="password"  placeholder="Enter Password" required="required"/>
    				<form:errors path="pass"></form:errors>
    			</div>
    			<button type="reset" class="btn btn-dark ">Reset</button>
    			<button type="submit" class="btn btn-dark float-right">LogIn</button> <br/><br/>
    			<p class="text-center">Not a Member? <a href="register">Register</a></p>
    		</form:form>
    	</div>
    </section>
    
    <!--
    
    <footer class="page-footer fixed-bottom font-small bg-secondary pt-2">
    	<div class="footer-copyright text-center py-1">
    		Copyright &copy 2019
    	</div>
    </footer>
    
    -->
    
</body>
</html>