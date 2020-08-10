<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Blood Test</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8" />
<meta name="keywords"
	content="Fashion Hub Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />

<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<!-- shop css -->
<link href="css/shop.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<!-- Owl-Carousel-CSS -->
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- font-awesome icons -->
<link href="css/fontawesome-all.min.css" rel="stylesheet">
<!-- //Custom Theme files -->
<!-- online-fonts -->
<link href="//fonts.googleapis.com/css?family=Elsie+Swash+Caps:400,900"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i"
	rel="stylesheet">
<!-- //online-fonts -->
</head>

<body>
	<!-- header -->
	<header>
<nav class="top_nav d-flex pt-3 pb-1">
				<!-- logo -->
				<h1>
					<a class="navbar-brand" href="/home"><img
						src="images/dgenvoy.png" width="80" hight="80" class="img-fluid"
						alt="" /> </a>
				</h1>
				<!-- //logo -->
				<div class="fh_attr1ls_right_nav ml-auto d-flex">
					<!-- search form -->
					<form class="nav-search form-inline my-0 form-control"
						action="/testInfo" method="post">
						<select class="form-control input-lg" name="category"
							id="category">
							<option value="all">Search more Test</option>
							<c:forEach var="testList" items="${testList}">
								<option value="${testList.testname}">${testList.testname}
									(${testList.altname})</option>
							</c:forEach>
						</select> <input class="btn btn-outline-secondary  ml-3 my-sm-0"
							type="submit" value="Search">
					</form>
					<!-- search form -->
			</nav>
				<!-- bottom nav -->
			<nav
				class="navbar navbar-expand-lg navbar-light justify-content-center">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto text-center">
						<li class="nav-item"><a class="nav-link  active" href="/home">Home
								<span class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link" href="about.html">About</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="blog.html">Blog</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="contact.html">Contact</a>
						</li>
					</ul>
				</div>
			</nav>
        <div class="fh_attr2modal-dialog modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Register Now</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body pt-3 pb-5 px-sm-5">
					<div class="row">

						<div class="col-md-6 mx-auto align-self-center">
							<img src="images/p3.png" class="img-fluid" alt="login_image" />
						</div>
						<div class="col-md-6">

							<p class="text-center mt-3">
								Already a member? <a href="/loginForm" class="text-dark login_btn">
									<u>Login Now</u></a>

							</p>
							<form:form method="POST" action="/registration" modelAttribute="userForm" class="form-signin">
								<div class="form-group">
									<c:choose>
										<c:when test="${not empty sucessmsg}">
											<p class="text-center mt-3" style="color:red">
												${sucessmsg}
												</p>
										</c:when>
										<c:when test="${not empty errormsg}">
											
											<p class="text-center mt-3" style="color:red">
												${errormsg}
												</p>
										</c:when>
									</c:choose>
								</div>
								<spring:bind path="username">
								<div class="form-group ${status.error ? 'has-error' : ''}">
									<label for="recipient-name1" class="col-form-label">Email Id</label> <form:input type="text" class="form-control" placeholder=" "
										name="username" id="username" path="username"  required=""></form:input>
										<form:errors path="username"></form:errors>
								</div>
								</spring:bind>
								<spring:bind path="name">
								<div class="form-group${status.error ? 'has-error' : ''}">
									<label for="recipient-email" class="col-form-label">Full name
										</label> <form:input type="tel" class="form-control" value=""
										path="name" name="name" required=""></form:input>
										<form:errors path="name"></form:errors>
								</div>
								</spring:bind>
								<spring:bind path="phonenumber">
								<div class="form-group${status.error ? 'has-error' : ''}">
									<label for="recipient-email" class="col-form-label">Phone
										Number</label> <form:input type="tel" class="form-control" value=""
										path="phonenumber" name="phonenumber" required=""></form:input>
										<form:errors path="phonenumber"></form:errors>
								</div>
								</spring:bind>
								<spring:bind path="password">
								<div class="form-group${status.error ? 'has-error' : ''}">
									<label for="password1" class="col-form-label">Password
										</label> <form:input type="password" class="form-control" 
										path="password" name="password" required=""></form:input>
										<form:errors path="password"></form:errors>
								</div>
								</spring:bind>
								<spring:bind path="confirmpassword">
								<div class="form-group${status.error ? 'has-error' : ''}">
									<label for="password2" class="col-form-label">Confirm Password
										</label> <form:input type="password" class="form-control" 
										path="confirmpassword" name="confirmpassword" required=""></form:input>
										<form:errors path="confirmpassword"></form:errors>
								</div>
								</spring:bind>
								
								

								<div class="right-fh_attr1l">
									<input type="submit" class="form-control" value="Register">
								</div>
								</form:form>
						</div>
					</div>
				</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
  </body>
</html>