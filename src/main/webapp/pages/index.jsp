
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Blood Test</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8" />
<meta name="keywords"
	content="Fashion Hub Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
	function callcheckout() {
		var x = document.getElementById("cart_table").rows.length;
		//alert(x);
		var cart_arr = new Array();
		var itr = 0;
		var list = "";
		for (var i = 1; i <= x; i++) {

			var hub_item = document.getElementById("hub_item_" + i).value;
			var price = document.getElementById("amount_" + i).value;
			list += document.getElementById("hub_item_" + i).value + "*";
			list += document.getElementById("amount_" + i).value + "*";
			cart_arr[itr] = hub_item;
			itr++;
			cart_arr[itr] = price;
			itr++;

		}
		document.getElementById("clist").value = list;
		//alert(list);

	}
</script>
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

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <style>
  .ui-autocomplete-loading {
    background: white url("images/ui-anim_basic_16x16.gif") right center no-repeat;
  }
  </style>
 </head>

<body>
	<!-- header -->
	<header>
		<div class="container">
			<!-- top nav -->
			<nav class="top_nav d-flex pt-3 pb-1">
				<!-- logo -->
				<h1>
					<a class="navbar-brand" href="/"><img
						src="images/dgenvoy.png" width="80" hight="80" class="img-fluid"
						alt="" /> </a>
				</h1>
				<!-- //logo -->
				<div class="fh_attr1ls_right_nav ml-auto d-flex">
					<!-- search form -->
					
					<form class="nav-search form-inline my-0 form-control"
						action="/quickViewT" method="post">
						<marquee>Services available in Pune,Mumbai </marquee>
						<input type="text" class="form-control input-lg" name="testname" id="testname" placeholder ="Search more Test">
						<input class="btn btn-outline-secondary  ml-3 my-sm-0"
							type="submit" value="Search">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div>Pune :<i class="fas fa-phone" ></i>+91 9082063964<br>
							Mumbai:<i class="fas fa-phone" ></i>+91 8888584573
							</div>
					</form>
					<!-- search form -->
					<div class="nav-icon d-flex">

						<!-- shopping cart -->
						<div class="cart-mainf" style="padding-top: 20px;">
							<div class="hubcart hubcart2 cart cart box_1">
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart"> <input
										type="hidden" name="display" value="1">
									<button class="btn top_hub_cart mt-1" type="submit"
										name="submit" value="" title="Cart">
										<i class="fas fa-shopping-bag"></i>
									</button>
								</form>
							</div>
						</div>
						<!-- //shopping cart ends here -->
						<div class="container" style="padding-top: 20px;">
							<c:if test="${pageContext.request.userPrincipal.name != null}">
								<form id="logoutForm" method="POST"
									action="${contextPath}/logout">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>
								<nav
									class="navbar navbar-expand-lg navbar-light justify-content-center">
									<button class="navbar-toggler" type="button"
										data-toggle="collapse" data-target="#navbarSupportedContent"
										aria-controls="navbarSupportedContent" aria-expanded="false"
										aria-label="Toggle navigation">
										<span class="navbar-toggler-icon"></span>
									</button>
									<div class="collapse navbar-collapse"
										id="navbarSupportedContent">
										<ul class="navbar-nav mx-auto text-center">
											<li class="nav-item dropdown has-mega-menu"
												style="position: static;"><a
												class="nav-link dropdown-toggle" data-toggle="dropdown"
												href="#" role="button" aria-haspopup="true"
												aria-expanded="false"><i class="fa fa-bars"></i></a>
												<div class="dropdown-menu" style="width: 100%">
													<div class="px-0 container">
														<div class="row">
															<div class="col-md-4">
																<a class="dropdown-item" href="/orderHistory">Booking
																	History</a> <a class="dropdown-item" href="men.html">Privacy</a>
																<a class="dropdown-item"
																	onclick="document.forms['logoutForm'].submit()"
																	role="button"> Logout</a>

															</div>

														</div>
													</div>
												</div>
												</li>
										</ul>
									</div>
								</nav>
							</c:if>
						</div>
					</div>
					<!-- sigin and sign up -->
					<c:if test="${pageContext.request.userPrincipal.name == null}">
						</a>
						<a class="text-dark login_btn align-self-center mx-3"
							href="/loginForm" role="button"> <i class="far fa-user"
							style="width: 100px;"> Login</i>
						</a>
					</c:if>
					<!-- sigin and sign up -->
				</div>
			</nav>

			<!-- //top nav -->
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
						<li class="nav-item"><a class="nav-link  active" href="/">Home
								<span class="sr-only">(current)</span>
						</a></li>

						<li class="nav-item"><a class="nav-link" href="/about">About</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/blog">Blog</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/contact">Contact</a>
						</li>
					</ul>
				</div>
			</nav>
			<!-- //bottom nav -->
		</div>
		<!-- //header container -->
	</header>
	<!-- //header -->
	<!-- banner -->
	<div class="banner-text">
		<div class="callbacks_container">
			<ul class="rslides" id="slider3">
				<li class="banner">
					<div class="container">
						<h3 class="fh_attr2_btxt">
							<span>B</span>lood <span>T</span>est
						</h3>
						<h4 class="fh_attr1_bbot">Get lab test and full body checkups
							at your home</h4>
						<div class="slider-info mt-sm-5">

							<div class="bnr_clip position-relative">
								<h4>
									get up to <span class="px-2">10% </span>
								</h4>
								<div
									class="d-inline-flex flex-column banner-pos position-absolute text-center">
									<div class="bg-flex-item">
										<span>O</span>
									</div>
									<div class="bg-flex-item">
										<span>F</span>
									</div>
									<div class="bg-flex-item">
										<span>F </span>
									</div>
								</div>
								<p class="py-2">on Health packages</p>
								</br> <a class="btn btn-primary mt-3 text-capitalize"
									href="/testWithDiscount/0/0" role="button">book now</a>
							</div>
						</div>
					</div>
				</li>
				<li class="banner banner2">
					<div class="container">
						<h3 class="fh_attr2_btxt">
							<span>B</span>lood <span>T</span>est
						</h3>
						<h4 class="fh_attr1_bbot"></h4>
						<div class="slider-info mt-sm-5">

							<div class="bnr_clip position-relative">
								<h4>We do all test</h4>

								<p class="py-2">All test at home and get reports in 1-2 days</p>
								</br> <a class="btn btn-primary mt-3 text-capitalize"
									href="/allTest" role="button">book now</a>
							</div>
						</div>
					</div>
				</li>
				<li class="banner banner3">
					<div class="container">
						<h3 class="fh_attr2_btxt">
							<span>B</span>lood <span>T</span>est
						</h3>
						<h4 class="fh_attr1_bbot">offers on online booking</h4>
						<div class="slider-info mt-sm-5">

							<div class="bnr_clip position-relative">


								<p class="py-2">Book one health check up above Rs. 1000 and
									get Rs. 100 OFF</p>
								</br> <a class="btn btn-primary mt-3 text-capitalize"
									href="/allTest" role="button">Book now</a>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- //banner -->
	</br>
	<!--services
	<div class="fh_attr2its-services" id="services">
		<div class="no-gutters fh_attr2its-services-row row">
			<div class="col-lg-3 col-sm-6 fh_attr2its-services-grids p-sm-5 p-3">
				<span class="fas fa-sync-alt p-4"></span>
				<h4 class="mt-2 mb-3">Reports in 48 hours</h4>
			</div>
			<div class="col-lg-3 col-sm-6 fh_attr2its-services-grids p-sm-5 p-3">
				<span class="fas fa-gift p-4"></span>
				<h4 class="mt-2 mb-3">Gift Card</h4>
			</div>

			<div class="col-lg-3 col-sm-6 fh_attr2its-services-grids p-sm-5 p-3">
				<span class="fas fa-lock p-4"></span>
				<h4 class="mt-2 mb-3">secure payments</h4>
			</div>
			<div class="col-lg-3 col-sm-6 fh_attr2its-services-grids p-sm-5 p-3">
				<span class="fas fa-shipping-fast p-4"></span>
				<h4 class="mt-2 mb-3">Free home sample collection</h4>
			</div>
		</div>
	</div>
	<!-- //services-->
	</br>
	<!-- about 
    <div class="row no-gutters pb-5">
        <div class="col-sm-4">
            <div class="hovereffect">
                <img class="img-fluid" src="images/a1.jpg" alt="">
                <div class="overlay">
                    <h5>women's fashion</h5>
                    <a class="info" href="women.html">Shop Now</a>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="hovereffect">
                <img class="img-fluid" src="images/a2.jpg" alt="">
                <div class="overlay">
                    <h5>men's fashion</h5>
                    <a class="info" href="men.html">Shop Now</a>
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="hovereffect">
                <img class="img-fluid" src="images/a3.jpg" alt="">
                <div class="overlay">
                    <h5>kid's fashion</h5>
                    <a class="info" href="girls.html">Shop Now</a>
                </div>
            </div>
        </div>
    </div>
    about -->
	<!-- product tabs -->
	<section class="tabs_pro py-md-5 pt-sm-3 pb-5">
		<h3 class="head_fh_attr2info text-center text-capitalize pb-5">
			<span></span>
		</h3>
		<div class="tabs tabs-style-line pt-md-5">
			<nav class="container">
				<ul id="clothing-nav" class="nav nav-tabs tabs-style-line"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" href="#women"
						id="women-tab" role="tab" data-toggle="tab" aria-controls="women"
						aria-expanded="true">Top booked Test</a></li>
				</ul>
			</nav>
			<!-- Content Panel -->
			<div id="clothing-nav-content" class="tab-content py-sm-5">
				<div role="tabpanel" class="tab-pane fade show active" id="women"
					aria-labelledby="women-tab">
					<div id="owl-demo" class="owl-carousel text-center">
						<c:forEach var="testList" items="${testList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${testList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${testList.testname}</b></br> ${testList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${testList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${testList.price}</p>
											<p class="line-through">&#8377;${testList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->

									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${testList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${testList.testname}">
											<input type="hidden" name="amount" value="${testList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>

						<div class="item">
							<div class="product-men p-3 text-center">
								<!-- <img src="images/p2.png" class="img-responsive" alt="" />-->
								<a href="/allTest" class="btn btn-lg bg-info text-white">view
									more</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="tabs tabs-style-line pt-md-5">
			<nav class="container">
				<ul id="clothing-nav" class="nav nav-tabs tabs-style-line"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" href="#women"
						id="women-tab" role="tab" data-toggle="tab" aria-controls="women"
						aria-expanded="true">All Test</a></li>
				</ul>
			</nav>
			<!-- Content Panel -->
			<div id="clothing-nav-content" class="tab-content py-sm-5">
				<div role="tabpanel" class="tab-pane fade show active" id="women"
					aria-labelledby="women-tab">
					<div id="owl-demo" class="owl-carousel text-center">
						<c:forEach var="testList" items="${testList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${testList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${testList.testname}</b></br> ${testList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${testList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${testList.price}</p>
											<p class="line-through">&#8377;${testList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${testList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${testList.testname}">
											<input type="hidden" name="amount" value="${testList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>

						<div class="item">
							<div class="product-men p-3 text-center">
								<!-- <img src="images/p2.png" class="img-responsive" alt="" />-->
								<a href="/allTest" class="btn btn-lg bg-info text-white">view
									more</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="tabs tabs-style-line pt-md-5">
			<nav class="container">
				<ul id="clothing-nav" class="nav nav-tabs tabs-style-line"
					role="tablist">
					<li class="nav-item"><a class="nav-link active" href="#women"
						id="women-tab" role="tab" data-toggle="tab" aria-controls="women"
						aria-expanded="true">Packages</a></li>
				</ul>
			</nav>
			<!-- Content Panel -->
			<div id="clothing-nav-content" class="tab-content py-sm-5">
				<div role="tabpanel" class="tab-pane fade show active" id="women"
					aria-labelledby="women-tab">
					<div id="owl-demo" class="owl-carousel text-center">
						<c:forEach var="packageList" items="${packageList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
									
									<img src="images/${packageList.image}" alt="img" class="card-img-top" height="200" width="80">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="/quickViewP/${packageList.packagename}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${packageList.packagename}</b></br> ${packageList.altpname}
										</h5>
										<h5 class="card-title text-capitalize">${packageList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${packageList.price}</p>
											<p class="line-through">&#8377;${packageList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewP" method="post">
											<input type="hidden" name="packagename"
												value="${packageList.packagename}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item"
												value="${packageList.packagename}"> <input
												type="hidden" name="amount" value="${packageList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>

						<div class="item">
							<div class="product-men p-3 text-center">
								<a href="/allPackages" class="btn btn-lg bg-info text-white">view
									more</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
    <!-- product tabs -->
    <section class="tabs_pro py-md-5 pt-sm-3 pb-5">
        <h5 class="head_fh_attr2info text-center text-capitalize pb-5">
            <span></span>Categories</h5>
        <div class="tabs tabs-style-line pt-md-5">
            <nav class="container">
                <ul id="clothing-nav" class="nav nav-tabs tabs-style-line" role="tablist">
                 <li class="nav-item">
                        <a class="nav-link active" href="#all" id="all-tab" role="tab" data-toggle="tab" aria-controls="all" aria-expanded="true">All Test</a>
                    </li>
              <c:forEach var="categoryList" items="${categoryList}">
               
                    <li class="nav-item">
                        <a class="nav-link" href="#${categoryList.categoryname}"  role="tab" id="${categoryList.categoryname}-tab"  data-toggle="tab" aria-controls="${categoryList.categoryname}">${categoryList.categoryname}</a>
                    </li>
                    </c:forEach>
                </ul>
            </nav>
            <!-- Content Panel -all test-->
            <div id="clothing-nav-content" class="tab-content py-sm-5">
             <div role="tabpanel" class="tab-pane fade show active" id="all-tab" aria-labelledby="all-tab" >
                    <div id="owl-demo" class="owl-carousel text-center">
                    <c:forEach var="testList" items="${testList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${testList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${testList.testname}</b></br> ${testList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${testList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${testList.price}</p>
											<p class="line-through">&#8377;${testList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${testList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${testList.testname}">
											<input type="hidden" name="amount" value="${testList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>
                        
                        
                        <div class="item">
                            <div class="product-men p-3 text-center">
                                <a href="/alltest" class="btn btn-lg bg-info text-white">view more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- CancerList -->
                <div role="tabpanel" class="tab-pane fade" id="${Cancer}" aria-labelledby="${Cancer}-tab">
                    <div id="owl-demo" class="owl-carousel text-center">
            		<c:forEach var="CancerList" items="${CancerList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${CancerList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${CancerList.testname}</b></br> ${CancerList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${CancerList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${CancerList.price}</p>
											<p class="line-through">&#8377;${CancerList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${CancerList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${CancerList.testname}">
											<input type="hidden" name="amount" value="${CancerList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>
                        
                        
                        <div class="item">
                            <div class="product-men p-3 text-center">
                                <a href="/allTestbyCategory/${Cancer}/1" class="btn btn-lg bg-info text-white">view more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--DiabetesList  -->
                  <div role="tabpanel" class="tab-pane fade" id="${Diabetes}" aria-labelledby="${Diabetes}-tab">
                    <div id="owl-demo" class="owl-carousel text-center">
            		<c:forEach var="DiabetesList" items="${DiabetesList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${DiabetesList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${DiabetesList.testname}</b></br> ${DiabetesList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${DiabetesList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${DiabetesList.price}</p>
											<p class="line-through">&#8377;${DiabetesList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${DiabetesList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${DiabetesList.testname}">
											<input type="hidden" name="amount" value="${DiabetesList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>
                        
                        
                        <div class="item">
                            <div class="product-men p-3 text-center">
                                <a href="/allTestbyCategory/${Diabetes}/1" class="btn btn-lg bg-info text-white">view more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--DigestionList  -->
                  <div role="tabpanel" class="tab-pane fade" id="${Digestion}" aria-labelledby="${Digestion}-tab">
                    <div id="owl-demo" class="owl-carousel text-center">
            		<c:forEach var="DigestionList" items="${DigestionList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${DigestionList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${DigestionList.testname}</b></br> ${DigestionList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${DigestionList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${DigestionList.price}</p>
											<p class="line-through">&#8377;${DigestionList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${DigestionList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${DigestionList.testname}">
											<input type="hidden" name="amount" value="${DigestionList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>
                        
                        
                        <div class="item">
                            <div class="product-men p-3 text-center">
                                <a href="/allTestbyCategory/${Digestion}/1" class="btn btn-lg bg-info text-white">view more</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!--KidneyList  -->
                  <div role="tabpanel" class="tab-pane fade" id="${Kidney}" aria-labelledby="${Kidney}-tab">
                    <div id="owl-demo" class="owl-carousel text-center">
            		<c:forEach var="KidneyList" items="${KidneyList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${KidneyList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${KidneyList.testname}</b></br> ${KidneyList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${KidneyList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${KidneyList.price}</p>
											<p class="line-through">&#8377;${KidneyList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${KidneyList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${KidneyList.testname}">
											<input type="hidden" name="amount" value="${KidneyList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>
                        
                        
                        <div class="item">
                            <div class="product-men p-3 text-center">
                                <a href="/allTestbyCategory/${Kidney}/1" class="btn btn-lg bg-info text-white">view more</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!--DiabetesList  -->
                  <div role="tabpanel" class="tab-pane fade" id="${Skin}" aria-labelledby="${Skin}-tab">
                    <div id="owl-demo" class="owl-carousel text-center">
            		<c:forEach var="SkinList" items="${SkinList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${SkinList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${SkinList.testname}</b></br> ${SkinList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${SkinList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${SkinList.price}</p>
											<p class="line-through">&#8377;${SkinList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${SkinList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${SkinList.testname}">
											<input type="hidden" name="amount" value="${SkinList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>
                        
                        
                        <div class="item">
                            <div class="product-men p-3 text-center">
                                <a href="/allTestbyCategory/${Skin}/1" class="btn btn-lg bg-info text-white">view more</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!--Sexual WellnessList  -->
                  <div role="tabpanel" class="tab-pane fade" id="${SexualWellness}" aria-labelledby="${SexualWellness}-tab">
                    <div id="owl-demo" class="owl-carousel text-center">
            		<c:forEach var="SexualWellnessList" items="${SexualWellnessList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${SexualWellnessList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${SexualWellnessList.testname}</b></br> ${SexualWellnessList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${SexualWellnessList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${SexualWellnessList.price}</p>
											<p class="line-through">&#8377;${SexualWellnessList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${SexualWellnessList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${SexualWellnessList.testname}">
											<input type="hidden" name="amount" value="${SexualWellnessList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>
                        
                        
                        <div class="item">
                            <div class="product-men p-3 text-center">
                                <a href="/allTestbyCategory/${SexualWellness}/1" class="btn btn-lg bg-info text-white">view more</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!--BoneList  -->
                  <div role="tabpanel" class="tab-pane fade" id="${Bone}" aria-labelledby="${Bone}-tab">
                    <div id="owl-demo" class="owl-carousel text-center">
            		<c:forEach var="BoneList" items="${BoneList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${BoneList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${BoneList.testname}</b></br> ${BoneList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${BoneList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${BoneList.price}</p>
											<p class="line-through">&#8377;${BoneList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${BoneList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${BoneList.testname}">
											<input type="hidden" name="amount" value="${BoneList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>
                        
                        
                        <div class="item">
                            <div class="product-men p-3 text-center">
                                <a href="/allTestbyCategory/${Bone}/1" class="btn btn-lg bg-info text-white">view more</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--BoneList  -->
                  <div role="tabpanel" class="tab-pane fade" id="${Fever}" aria-labelledby="${Fever}-tab">
                    <div id="owl-demo" class="owl-carousel text-center">
            		<c:forEach var="FeverList" items="${FeverList}">
							<div class="item">
								<!-- card -->
								<div class="card product-men p-3">
									<div class="men-thumb-item">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="quickViewT/${FeverList.testname}"
													class="link-product-add-cart">Quick View</a>
											</div>
										</div>
									</div>
									<!-- card body -->
									<div class="card-body  py-3 px-2">
										<h5 class="card-title text-capitalize">
											<b>${FeverList.testname}</b></br> ${FeverList.altname}
										</h5>
										<h5 class="card-title text-capitalize">${FeverList.dscr}</h5>
										<div class="card-text d-flex justify-content-between">
											<p class="text-dark font-weight-bold">&#8377;${FeverList.price}</p>
											<p class="line-through">&#8377;${FeverList.actprice}</p>
										</div>
									</div>
									<!-- card footer -->
									<div class="card-footer d-flex justify-content-end">
										<form action="/quickViewT" method="post">
											<input type="hidden" name="testname"
												value="${FeverList.testname}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-info-circle" aria-hidden="true"></i>
											</button>
										</form>
										&nbsp;&nbsp;
										<form action="#" method="post">
											<input type="hidden" name="cmd" value="_cart"> <input
												type="hidden" name="add" value="1"> <input
												type="hidden" name="hub_item" value="${FeverList.testname}">
											<input type="hidden" name="amount" value="${FeverList.price}">
											<button type="submit" class="hub-cart phub-cart btn">
												<i class="fa fa-cart-plus" aria-hidden="true"></i>
											</button>
											<a href="#" data-toggle="modal" data-target="#myModal1"></a>
										</form>
									</div>
								</div>
								<!-- //card -->
							</div>
						</c:forEach>
                        
                        
                        <div class="item">
                            <div class="product-men p-3 text-center">
                                <a href="/allTestbyCategory/${Fever}/1" class="btn btn-lg bg-info text-white">view more</a>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
	<!-- //product tabs -->
		<!-- footer -->
	<footer>
		<div class="footerv2-fh_attr1ls">
			<div class="footer-fh_attr1lfh_attr2-innerr">
				<!-- footer-top -->

				<!-- //footer-top -->
				<div class="footer-bottomv2 py-5">
					<div class="container">
						<ul class="bottom-links-fh_attr2">
							<li><a href="/">Home</a></li>
							<li><a href="/about">About Us</a></li>
							<li><a href="/blog">Blog</a></li>
							<li><a href="/contact">Contact</a></li>

						</ul>
						<h3 class="text-center follow">Follow Us</h3>
						<ul class="social-iconsv2 fh_attr2info">
							<li><a href="#"> <i class="fab fa-facebook-f"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-twitter"></i>
							</a></li>

							<li><a href="#"> <i class="fab fa-youtube"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-linkedin-in"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-google-plus-g"></i>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="container-fluid py-5 footer-copy_fh_attr1ls">
				<div class="d-lg-flex justify-content-between">
					<div class="mt-2 sub-some align-self-lg-center">
						<h5>Payment Method</h5>
						<ul class="mt-4">
							<li class="list-inline-item"><img src="images/pay2.png"
								alt=""></li>
							<li class="list-inline-item"><img src="images/pay5.png"
								alt=""></li>
							<li class="list-inline-item"><img src="images/pay3.png"
								alt=""></li>
							<li class="list-inline-item"><img src="images/pay7.png"
								alt=""></li>
							<li class="list-inline-item"><img src="images/pay8.png"
								alt=""></li>
							<li class="list-inline-item "><img src="images/pay9.png"
								alt=""></li>
						</ul>
					</div>
					<div class="cpy-right align-self-center">
						<h2 class="fh_attr2_btxt">
							<a href="index.html"> <span>B</span>lood <span>T</span>est
							</a>
						</h2>
						<p>© 2020 Blood Test. All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- //footer -->
	
	<script type="text/javascript" src="/js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
	<!-- script for show signin and signup modal -->
	<script>
		$(document).ready(function() {
			//$("#myModal_btn").modal();

		});
	</script>
	<!-- //script for show signin and signup modal -->
	<!-- smooth dropdown -->
	<script>
		$(document).ready(
				function() {
					$('ul li.dropdown').hover(
							function() {
								$(this).find('.dropdown-menu').stop(true, true)
										.delay(200).fadeIn(200);
							},
							function() {
								$(this).find('.dropdown-menu').stop(true, true)
										.delay(200).fadeOut(200);
							});
				});
	</script>
	<!-- //smooth dropdown -->
	<!-- script for password match -->
	<script>
		window.onload = function() {
			document.getElementById("password").onchange = validatePassword;
			document.getElementById("confirmpassword").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("confirmpassword").value;
			var pass1 = document.getElementById("password").value;
			if (pass1 != pass2)
				document.getElementById("confirmpassword").setCustomValidity(
						"Passwords Don't Match");
			else
				document.getElementById("confirmpassword")
						.setCustomValidity('');
			//empty string means no validation error
		}
	</script>
	<!-- script for password match -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <style>
  .ui-autocomplete-loading {
    background: white url("images/ui-anim_basic_16x16.gif") right center no-repeat;
  }
  </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#testname").autocomplete({
				source: "plantNamesAutocomplete", 
				minLength: 3,
				select: function(event, ui) {
					this.value = ui.item.label;
					//$("#Plant_ID").val(ui.item.value);
					return false;
				}
			});

		});
	</script>
	<!-- Banner Responsiveslides -->
	<script type="text/javascript" src="js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function() {
			// Slideshow 4
			$("#slider3").responsiveSlides({
				auto : true,
				pager : true,
				nav : false,
				speed : 500,
				namespace : "callbacks",
				before : function() {
					$('.events').append("<li>before event fired.</li>");
				},
				after : function() {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<!-- // Banner Responsiveslides -->
	<!-- Product slider Owl-Carousel-JavaScript -->
	<script type="text/javascript" src="js/owl.carousel.js"></script>
	<script>
		var owl = $('.owl-carousel');
		owl.owlCarousel({
			items : 4,
			loop : false,
			margin : 10,
			autoplay : true,
			autoplayTimeout : 5000,
			autoplayHoverPause : false,
			responsive : {
				320 : {
					items : 1,
				},
				568 : {
					items : 2,
				},
				991 : {
					items : 3,
				},
				1050 : {
					items : 4
				}
			}
		});
	</script>
	<!-- //Product slider Owl-Carousel-JavaScript -->
	<!-- cart-js -->
	<script type="text/javascript" src="js/minicart.js">
		
	</script>
	<script>
		hub.render();

		hub.cart.on('new_checkout', function(evt) {
			var items, len, i;

			if (this.subtotal() > 0) {
				items = this.items();

				for (i = 0, len = items.length; i < len; i++) {
				}
			}
		});
	</script>
	<!-- //cart-js -->
	<!-- start-smooth-scrolling -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->
	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function() {
			/*
			var defaults = {
			    containerID: 'toTop', // fading element id
			    containerHoverID: 'toTopHover', // fading element hover id
			    scrollSpeed: 1200,
			    easingType: 'linear' 
			};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<script type="text/javascript" src="js/SmoothScroll.min.js"></script>
	<!-- //smooth-scrolling-of-move-up -->
	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="js/bootstrap.js"></script>

</body>

</html>