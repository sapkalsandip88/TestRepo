<%@page import="java.util.StringTokenizer"%>
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
<script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<!-- shop css -->
<link href="css/shop.css" type="text/css" rel="stylesheet" media="all">
<link href="css/checkout.css" type="text/css" rel="stylesheet"
	media="all">
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
<script>
      $(document).ready(function() {
         function disablePrev() { window.history.forward() }
         window.onload = disablePrev();
         window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
      });
   </script>
<body>	
<%
		String list = request.getParameter("clist");
	%>
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
	<!-- inner banner -->
	<div class="ibanner_fh_attr1 pt-sm-5 pt-3">
		<h3 class="fh_attr2_btxt">
                            <span>B</span>lood
                            <span>T</span>est
                        </h3>
	</div>
	<!-- //inner banner -->
	<!-- breadcrumbs -->
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.html">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Contact
				Us</li>
		</ol>
	</nav>
	<!-- //breadcrumbs -->
	<!--checkout-->
	<section class="checkout_fh_attr3 py-sm-5 py-3">
		<div class="container">
			<div class="check_fh_attr1ls">
				<div class="d-sm-flex justify-content-between mb-4">
					<h4>Review your booking</h4>
					<h4 class="mt-sm-0 mt-3">
						<span></span>
					</h4>
				</div>
				<div class="checkout-right">
					<table class="timetable_sub" id="timetable_sub">
						<thead>
							<tr>
								<th>SL No.</th>
								<th>Test Name</th>
								<th>Price</th>
							</tr>
						</thead>
						<tbody>
							<%
								StringTokenizer st1 = new StringTokenizer(list, "*");
								int count = 0;
								while (st1.hasMoreTokens()) {
									String rem = "rem";
									String close = "close";
									String testname = "testname";
									String price = "price";
									count++;
									rem = rem + "" + count;
									close = close + "" + count;
									testname = testname + "" + count;
									price = price + "" + count;
							%>
							<tr class="<%=rem%>">
								<td class="invert"><%=count%></td>
								<td class="invert" id="<%=testname%>"><%=st1.nextToken()%></td>
								<td class="invert" id="<%=price%>">&#8377;<%=st1.nextToken()%></td>
								<!-- <td class="invert">
									<div class="rem">
										<div class="<%=close%>"></div>
									</div>

								</td>-->
							</tr>
							<%
								}
							%>

						</tbody>
					</table>
				</div>
				</br>
				<div align="center">
					<input class="btn btn-outline-secondary  ml-3 my-sm-0"
						value="Continue to CheckOut" id="checkoutbtn" onclick="unHide();">
				</div>
				<div class="row checkout-left mt-5" id="checkout_det">
					<div class="col-md-4 checkout-left-basket">
						<h4>Booking Details</h4>
						<ul id="bookingdetails"  name="testdetails">

						</ul>
					</div>
					<div class="col-md-8 address_form">
						<h4>Billing Address</h4>
						<form action="/confirmbooking"  method="Post"
							class="creditly-card-form shopf-sear-headinfo_form">
							<input type="hidden" id="clist" name="clist"/>
							<div class="creditly-wrapper wrapper">
								<div class="information-wrapper">
									<div class="first-row form-group">
										<div class="controls">
											<label class="control-label">Full Name: </label> <input
												class="billing-address-name form-control" type="text"
												name="fname" id="fname" placeholder="Full name">
										</div>
										<div class="controls">
											<label class="control-label">Age </label> <input
												class="billing-address-name form-control" type="text"
												name="age" id="age" placeholder="Age">
										</div>
										<div class="controls">
											<label class="control-label">Gender</label> 
											<select id="gender" name="gender" class="form-control option-fieldf">
												<option>Male</option>
												<option>Female</option>
												<option>Other</option>

											</select>
										</div>
										<div class="card_number_grids">
											<div class="card_number_grid_left">
												<div class="controls">
													<label class="control-label">Mobile number:</label> <input
														class="form-control" type="text" id="mobileno" name="mobileno"
														placeholder="Mobile number">
												</div>
											</div>
											
												<div class="controls">
													<label class="control-label">House No./Street Name: </label> <input
														class="form-control" type="text" id="housestreet" name="housestreet" placeholder="House No.,Street Name">
												</div>
											<div class="card_number_grid_right">
												<div class="controls">
													<label class="control-label">Landmark: </label> <input
														class="form-control" type="text" id="landmark" name="landmark" placeholder="Landmark">
												</div>
											</div>
											
											<div class="clear"></div>
										</div>
										<div class="controls">
											<label class="control-label">Town/City: </label> <input
												class="form-control" type="text" id="towncity" name="towncity" placeholder="Town/City">
										</div>
										
												<div class="controls">
													<label class="control-label">Pin Code: </label> <input
														class="form-control" type="text" id="pincode" name="pincode" placeholder="100001">
												</div>
										<div class="controls">
											<label class="control-label">Address type(Sample collection At): </label> <select id="addtype" name="addtype"
												class="form-control option-fieldf">
												<option>Office</option>
												<option>Home</option>
												<option>Commercial</option>

											</select>
										</div>
										<div class="controls">
											<label class="control-label">Payment Mode: </label> <select id="paytype" name="paytype"
												class="form-control option-fieldf">
												<option>Pay on Sample Collection</option>
												<option>Pay Now</option>
											</select>
										</div>
									</div>
									<button class="submit check_out">Confirm Booking</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--//checkout-->
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

	<!-- js -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
	<!-- smooth dropdown -->
	<script>
        $(document).ready(function () {
            $('ul li.dropdown').hover(function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(200);
            }, function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(200);
            });
        });
    </script>
	<!-- //smooth dropdown -->
	<!-- script for password match -->
	<script>
        window.onload = function () {
            document.getElementById("password1").onchange = validatePassword;
            document.getElementById("password2").onchange = validatePassword;
        }

        function validatePassword() {
            var pass2 = document.getElementById("password2").value;
            var pass1 = document.getElementById("password1").value;
            if (pass1 != pass2)
                document.getElementById("password2").setCustomValidity("Passwords Don't Match");
            else
                document.getElementById("password2").setCustomValidity('');
            //empty string means no validation error
        }
    </script>
	<!-- script for password match -->
	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
        hub.render();

        hub.cart.on('new_checkout', function (evt) {
            var items, len, i;

            if (this.subtotal() > 0) {
                items = this.items();

                for (i = 0, len = items.length; i < len; i++) {}
            }
        });
    </script>
	<!-- //cart-js -->
	<!--quantity-->
	<script>
        $('.value-plus').on('click', function () {
            var divUpd = $(this).parent().find('.value'),
                newVal = parseInt(divUpd.text(), 10) + 1;
            divUpd.text(newVal);
        });

        $('.value-minus').on('click', function () {
            var divUpd = $(this).parent().find('.value'),
                newVal = parseInt(divUpd.text(), 10) - 1;
            if (newVal >= 1) divUpd.text(newVal);
        });
    </script>
	<!--quantity-->
	<!-- FadeOut-Script -->
	<script>
    <%for (int c = 1; c <= count; c++) {%>
    $(document).ready(function (c) {
        
            $('.close<%=c%>').on('click', function (c) {
                $('.rem<%=c%>').fadeOut('slow', function (c) {
                    $('.rem<%=c%>').remove();
				});
			
			});

		});
	<%}%>
		
	</script>

	<!--// FadeOut-Script -->

	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
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
			 
	         
			$('#checkout_det').hide();
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
		function unHide() {
			//$('li').remove();
			$('#checkout_det').show();
			$('#checkoutbtn').hide();
			myFunction();
		}
		
		function myFunction() {
			var list="";
			var arr = [];
			var listarr =[];
			var totalprice = 0;
			var x = parseInt(document.getElementById("timetable_sub").rows.length) - 1;
			//alert(x);
			for (var i = 1; i <= x; i++) {
				
				var hub_item = document.getElementById("testname" + i).innerHTML;
				var price = document.getElementById("price" + i).innerHTML;
				list+=document.getElementById("testname"+i).innerHTML+"*";
				$('#bookingdetails').append("<li>" + hub_item + "<i>-</i><span>" + price+ "</span></li>");
			
					price = price.slice(1);
					totalprice += parseFloat(price);
					list+=parseFloat(price)+"*";
			}
			if(totalprice<1000)
				{
				list+="Blood Sample Collection charges"+"*"+"100"+"*";
				$('#bookingdetails').append("<li>Blood Sample Collection charges<i>-</i><span>(+) &#8377; 100</span></li>");
				totalprice +=100;
				
				
				}
			else
				{
				list+="Blood Sample Collection charges"+"*"+"100"+"*";
				list+="Blood Sample Collection charges"+"*"+"-100"+"*";
				$('#bookingdetails').append("<li>Blood Sample Collection charges<i>-</i><span>(+) &#8377; 100</span></li>");
				$('#bookingdetails').append("<li>Blood Sample Collection charges<i>-</i><span>(-) &#8377; 100</span></li>");
			
				}
			$('#bookingdetails').append("<hr>");
			$('#bookingdetails').append("<li>Total <i>-</i><span>&#8377;" + totalprice + "</span></li>");
			$('#bookingdetails').append("<hr>");
			//list+="Total"+"*"+totalprice+"*";
			//alert(list);
			document.getElementById("clist").value=list;
		}
	</script>
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smooth-scrolling-of-move-up -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/bootstrap.js"></script>
</html>