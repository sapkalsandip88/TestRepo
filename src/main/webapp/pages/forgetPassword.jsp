<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="fh_attr2modal-dialog modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body  pt-3 pb-5 px-sm-5">
					<div class="row">
						<div class="col-md-6 align-self-center">
							<img src="images/p3.png" class="img-fluid" alt="login_image" />
						</div>
						<div class="col-md-6">
							<form action="/forgot-password" method="post">
							<c:choose>
										
										<c:when test="${not empty error}">
											
											<p class="text-center mt-3" style="color:red">
												${error}
												</p>
										</c:when>
										</c:choose>
								<div class="form-group">
									<label for="recipient-name" class="col-form-label">Email Id
										</label> <input type="text" class="form-control" placeholder=" "
										name="emailid" id="emailid" required="">
								</div>
								
								<div class="right-fh_attr1l">
									<input type="submit" class="form-control" value="Submit">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="js/bootstrap.js"></script>
</body>
</html>