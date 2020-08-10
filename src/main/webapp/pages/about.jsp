<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>Blood Test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8" />
    <meta name="keywords" content="Fashion Hub Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
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
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
    <!-- shop css -->
    <link href="css/shop.css" type="text/css" rel="stylesheet" media="all">
    <!-- faq -->
    <link href="css/faq.css" rel="stylesheet" type="text/css" media="all" />

    <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
    <!-- font-awesome icons -->
    <link href="css/fontawesome-all.min.css" rel="stylesheet">
    <!-- //Custom Theme files -->
    <!-- online-fonts -->
    <link href="//fonts.googleapis.com/css?family=Elsie+Swash+Caps:400,900" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <!-- //online-fonts -->
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
	</header>    <!-- //header -->
	
	<!-- //inner banner -->
    <!-- FAQ-help-page -->
    <div class="help about faq-sec">
        <div class="container">
            <h3 class="fh_attr1-head">About Us</h3>
            <div class="faq-fh_attr1fh_attr2">
                <h5> Avani Pathlogy is one of the leading diagnostics brands in India , with technically advanced labs and online portal.

Avani Pathlogy has a team of qualified senior pathologists and well trained technicians delivering diagnostic solutions in the areas of routine, semi specialty and super specialty domains like Oncology, Neurology, Gynaecology, Nephrology and many more.

We offer a comprehensive range of 4000+ clinical laboratory tests and profiles, which are used for prediction, early detection, diagnostic screening, confirmation and/or monitoring of the disease. We also offer analytical and support services to clinical research organizations for their clinical research projects.</h5>
               
            </div>
        </div>
    </div>
    <!-- //FAQ-help-page -->
 <footer>
        <div class="footerv2-fh_attr1ls">
            <div class="footer-fh_attr1lfh_attr2-innerr">
                <!-- footer-top -->
               
                <!-- //footer-top -->
                <div class="footer-bottomv2 py-5">
                    <div class="container">
                        <ul class="bottom-links-fh_attr2">
                            <li>
                                <a href="/">Home</a>
                            </li>
                            <li>
                                <a href="/about">About Us</a>
                            </li>
                            <li>
                                <a href="/blog">Blog</a>
                            </li>
                            <li>
                                <a href="/contact">Contact</a>
                            </li>

                        </ul>
                        <h3 class="text-center follow">Follow Us</h3>
                        <ul class="social-iconsv2 fh_attr2info">
                            <li>
                                <a href="#">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-twitter"></i>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <i class="fab fa-youtube"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-linkedin-in"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fab fa-google-plus-g"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container-fluid py-5 footer-copy_fh_attr1ls">
                <div class="d-lg-flex justify-content-between">
                    <div class="mt-2 sub-some align-self-lg-center">
                        <h5>Payment Method</h5>
                        <ul class="mt-4">
                            <li class="list-inline-item">
                                <img src="images/pay2.png" alt="">
                            </li>
                            <li class="list-inline-item">
                                <img src="images/pay5.png" alt="">
                            </li>
                            <li class="list-inline-item">
                                <img src="images/pay3.png" alt="">
                            </li>
                            <li class="list-inline-item">
                                <img src="images/pay7.png" alt="">
                            </li>
                            <li class="list-inline-item">
                                <img src="images/pay8.png" alt="">
                            </li>
                            <li class="list-inline-item ">
                                <img src="images/pay9.png" alt="">
                            </li>
                        </ul>
                    </div>
                    <div class="cpy-right align-self-center">
                        <h2 class="fh_attr2_btxt">
                            <a href="index.html">
                                <span>B</span>lood
                                <span>T</span>est</a>
                        </h2>
                        <p>© 2020 Blood Test. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- //footer -->
   
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
    <script src="js/minicart.js">
    </script>
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
    <!-- script for faq  tabs -->
    <script>
        $(function () {

            var menu_ul = $('.faq > li > ul'),
                menu_a = $('.faq > li > a');

            menu_ul.hide();

            menu_a.click(function (e) {
                e.preventDefault();
                if (!$(this).hasClass('active')) {
                    menu_a.removeClass('active');
                    menu_ul.filter(':visible').slideUp('normal');
                    $(this).addClass('active').next().stop(true, true).slideDown('normal');
                } else {
                    $(this).removeClass('active');
                    $(this).next().stop(true, true).slideUp('normal');
                }
            });

        });
    </script>
    <!-- script for faq tabs -->

    <!-- start-smooth-scrolling -->
    <script src="js/move-top.js"></script>
    <script src="js/easing.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();

                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 1000);
            });
        });
    </script>
    <!-- //end-smooth-scrolling -->
    <!-- smooth-scrolling-of-move-up -->
    <script>
        $(document).ready(function () {
            /*
            var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear' 
            };
            */

            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });
    </script>
    <script src="js/SmoothScroll.min.js"></script>
    <!-- //smooth-scrolling-of-move-up -->
    <!-- Bootstrap core JavaScript
================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/bootstrap.js"></script>
</body>

</html>