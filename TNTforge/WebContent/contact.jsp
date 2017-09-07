<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Contact Us</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script
	src="http://api.map.baidu.com/api?v=2.0&ak=EZPCgQ6zGu6hZSmXlRrUMTpr"></script>
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/map.jquery.min.js"></script>
<script src="js/jquery.baiduMap.min.js"></script>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">

<!-- All css files are included here -->
<!-- Bootstrap fremwork main css -->
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
<!-- This core.css file contents all plugings css file. -->
<link rel="stylesheet" href="css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet" href="css/shortcode/shortcodes.css">
<!-- Theme main style -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="css/custom.css">



<!-- Modernizr JS -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

	<!-- Body main wrapper start -->
	<div class="wrapper">
		<!-- Start of header area -->
		<header>
			<div class="header-top gray-bg">
				<div class="container">
					<div class="row">
						<div class="col-sm-5 hidden-xs">
							<div class="header-top-left">
								<ul class="header-top-style text-capitalize mr-25">
									<li id="myaccount"><a href="#"><span class="mr-10">My
												Account</span><i class="fa fa-angle-down"></i></a>
										<ul class="ul-style my-account box-shadow white-bg">
											<li><a href="LogOutservlet">Log Out</a></li>
											<li><a href="my-account.jsp">My Account</a></li>
										</ul></li>
								</ul>
								<!--
                                <ul class="header-top-style text-capitalize mr-25">
                                    <li><a href="#"><span class="mr-10">USD</span><i class="fa fa-angle-down"></i></a>
                                        <ul class="ul-style currency box-shadow white-bg">
                                            <li><a href="#"><i class="fa fa-usd"></i><span>USD</span></a></li>
                                            <li><a href="#"><i class="fa fa-euro"></i><span>Euro</span></a></li>
                                            <li><a href="#"><i class="fa fa-gbp"></i><span>GBP</span></a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <ul class="header-top-style pl-10">
                                    <li>
                                        <span class="mr-10"><img alt="" src="images/header/language/1-min.jpg"></span>
                                        <a href="#"><span class="mr-10">English</span><i class="fa fa-angle-down"></i></a>
                                        <ul class="ul-style language box-shadow white-bg">
                                            <li><a href="#"><img alt="" src="images/header/language/1-min.jpg"><span>English</span></a></li>
                                            <li><a href="#"><img alt="" src="images/header/language/2-min.jpg"><span>Germani</span></a></li>
                                            <li><a href="#"><img alt="" src="images/header/language/3-min.jpg"><span>French</span></a></li>
                                        </ul>
                                    </li>
                                </ul>
								-->
							</div>
						</div>
						<div class="col-sm-3 col-xs-6">
							<div class="header-top-middle">
								<ul class="header-top-style">
									<li id="loged"><a href="login.jsp"> <span>Login
												or Register</span>
									</a>
										<div class="ul-style login-register box-shadow white-bg p-30">
											<h6 class="mb-20">
												<strong>Login</strong>
											</h6>
											<input type="text" name="s" class="pl-30"
												placeholder="user name" id="user-name"> <input
												type="password" name="d" class="pl-30"
												placeholder="Password" id="password"> <label
												class="remmember"> <input type="checkbox">
												remember me
											</label>
											<button value="submit" class="btn-default">Login</button>
											<a href="login.jsp"><h6>
													<strong class="mb-20">or register to</strong>
												</h6></a>
											<ul class="login-social">
												<li><a href="#"><i class="fa fa-facebook"></i></a></li>
												<li><a href="#"><i class="fa fa-twitter"></i></a></li>
												<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
												<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
											</ul>
										</div></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-4 col-xs-6">
							<div class="header-top-right">
								<span class="mr-20"><a href="#"><img alt=""
										src="images/header/search-icon.png"></a></span> <span><input
									type="text" class="pl-10" placeholder="Search..."></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="header-bottom">
				<div class="container">
					<div class="row header-middle-content">
						<div class="col-md-5 col-sm-4 hidden-xs">
							<div class="service-inner mt-10">
								<span class="service-img b-img"> <img alt=""
									src="images/service.png">
								</span> <span class="service-content ml-15"><strong>+88
										(012) 564 979 56</strong><br>We are open 9 am - 10 pm</span>
							</div>
						</div>
						<div class="col-md-2 col-sm-4 col-xs-12">
							<div class="header-logo text-center">
								<a href="index.jsp"><img alt="" src="images/logo.png"></a>
							</div>
						</div>
						<div
							class="col-md-offset-0 col-md-5 col-sm-offset-0 col-sm-4 col-xs-offset-3 col-xs-6">
							<div class="shopping-cart">
								<a href="#"> <span class="shopping-cart-control"> <img
										alt="" src="images/shop.png">
								</span> <a href="shoppingcarts.jsp"><span class="cart-size-value"><strong>Shopping<br>Carts(<span
												id="count">
													<%
														if ((Map) session.getAttribute("goods") != null) {
															out.print(((HashMap) session.getAttribute("goods")).size());
														} else
															out.print(0);
													%>
											</span>)
										</strong></span></a>
								</a>

							</div>
						</div>
						<nav class="primary-menu">
							<ul class="header-top-style text-uppercase">
								<li><a href="index.jsp">home</a></li>
								<li><a href="about.jsp">about</a></li>
								<li><a href="shop.jsp">shop</a></li>
								<li><a href="contact.jsp">contact</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			<!-- Mobile Menu Start -->
			<div class="mobile-menu-area">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="mobile-menu">
								<nav id="dropdown">
									<ul>
										<li><a href="index.jsp">home</a></li>
										<li><a href="about.jsp">about</a></li>
										<li><a href="shop.jsp">shop</a></li>
										<li><a href="contact.jsp">contact</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Mobile Menu End -->
		</header>
		<!-- End of header area -->
		<!-- Start Breadcrumbs Area -->
		<div class="breadcrumbs-area breadcrumbs-bg ptb-60">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="breadcrumbs-inner">
							<h5 class="breadcrumbs-disc m-0">Best Products for you</h5>
							<h2 class="breadcrumbs-title text-black m-0">Contact Us</h2>
							<ul class="top-page">
								<li><a href="index.jsp">Home</a></li>
								<li>></li>
								<li>Contact us</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs Area -->
		<!-- Start page content -->
		<section id="page-content" class="page-wrapper pt-10">
			<!-- Start Contact Us Top Area -->
			<div class="contact-us-area pt-90">
				<div class="container">
					<div class="row">
						<div class="col-sm-4">
							<div class="single-contact-inner pull-left">
								<div class="text-center">
									<div class="contact-us-icon mb-20">
										<img src="images/contact/1.png" alt="">
									</div>
									<div class="contact-inner">
										<p>8901 Marmora Raod,</p>
										<p>Glasgow, D04 89GR</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="single-contact-inner text-center">
								<div class="contact-us-icon mb-20">
									<img src="images/contact/2.png" alt="">
								</div>
								<div class="contact-inner">
									<p>Telephone : (801) 4256 9856</p>
									<p>Telephone : (801) 4256 9658</p>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="single-contact-inner pull-right">
								<div class="text-center">
									<div class="contact-us-icon mb-20">
										<img src="images/contact/3.png" alt="">
									</div>
									<div class="contact-inner">
										<p>Email : info@forge.com</p>
										<p>Web : www.forge.com</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Contact Us Top Area -->
			<!-- Map Area Start -->
			<div class="map-area mtb-50">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div id="googleMap" style="width: 100%; height: 400px;">
								<div class="left"
									style="width: 100%; height: 700px; padding: 40px 20px; box-sizing: border-box; height: 500px;">
									<div id="container1" class="container"
										style="width: 100%; height: 100%; float: left;"></div>
								</div>
								<script type="text/javascript">
									new BaiduMap({
										id : "container1",
										title : {
											text : "TNT团队",
											className : "title"
										},
										content : {
											className : "content",
											text : [ "地址：大族企业湾六栋二",
													"电话：13210868396" ]
										},
										point : {
											lng : 116.522418,
											lat : 39.768358
										}
									});
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Map Area End -->

		</section>
		<!-- End page content -->
		<!-- Start footer area -->
		<footer id="footer" class="footer-area">
			<div class="footer-top-area text-center ptb-40">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="footer-top-content">
								<a href="index.jsp"> <img src="images/footer/logo.png"
									alt="">
								</a>
								<p class="pb-30">Forge is the best ecommerce site lorem
									ipsum dolor sit amet, consectetur aiscing elit, sed do eiusmod
									tempor incididunt ut labore et dolore</p>
								<ul class="social-icon">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
									<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
									<li><a href="#"><i class="fa fa-instagram"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-middle-area footer-bg">
				<div class="container">
					<div class="row">
						<div class="col-md-3 col-sm-6">
							<div class="single-footer-inner">
								<h5 class="footer-title text-white">CONTACT</h5>
								<ul class="footer-contact">
									<li class="contact-icon"><img alt=""
										src="images/footer/icon/1.png"></li>
									<li class="footer-text text-ash">
										<p>8901 Marmora Raod,</p>
										<p>Glasgow, D04 89GR</p>
									</li>
								</ul>
								<ul class="footer-contact">
									<li class="contact-icon"><img alt=""
										src="images/footer/icon/2.png"></li>
									<li class="footer-text text-ash">
										<p>Telephone : (801) 4256 9856</p>
										<p>Telephone : (801) 4256 9658</p>
									</li>
								</ul>
								<ul class="footer-contact">
									<li class="contact-icon"><img alt=""
										src="images/footer/icon/3.png"></li>
									<li class="footer-text text-ash">
										<p>Email : info@forge.com</p>
										<p>Web : www.forge.com</p>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-md-2 col-sm-6">
							<div class="single-footer-inner">
								<h5 class="footer-title text-white">CONTACT</h5>
								<ul class="footer-menu">
									<li><a href="index.jsp">Home</a></li>
									<li><a href="about.jsp">About us</a></li>
									<li><a href="contact.jsp">Contact us</a></li>
									<li><a href="#">Our blog</a></li>
									<li><a href="#">Support centre</a></li>
									<li><a href="#">Privacy policy</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-2 col-sm-3">
							<div class="single-footer-inner">
								<h5 class="footer-title text-white">SUPPORT</h5>
								<ul class="footer-menu">
									<li><a href="#">Delivery information</a></li>
									<li><a href="3">Order tracking</a></li>
									<li><a href="#">Return product</a></li>
									<li><a href="#">Gift card</a></li>
									<li><a href="#">Home delivery</a></li>
									<li><a href="#">Online support</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-5 col-sm-9">
							<h2 class="footer-title">LATEST TWEETS</h2>
							<div class="tweet-list">
								<ul class="left-tweet">
									<li class="tweet-inner clearfix">
										<div class="tweet-img">
											<a href="#"> <img alt="" src="images/footer/tweet/1.jpg">
											</a>
										</div>
										<div class="tweet-text">
											<a href="#">Forge is the best ecommerce elt</a>
											<p>Jan 25, 2017</p>
										</div>
									</li>
									<li class="tweet-inner clearfix">
										<div class="tweet-img">
											<a href="#"> <img alt="" src="images/footer/tweet/2.jpg">
											</a>
										</div>
										<div class="tweet-text">
											<a href="#">Forge is the best ecommerce elt</a>
											<p>Jan 25, 2017</p>
										</div>
									</li>
								</ul>
								<ul class="left-tweet">
									<li class="tweet-inner clearfix">
										<div class="tweet-img">
											<a href="#"> <img alt="" src="images/footer/tweet/1.jpg">
											</a>
										</div>
										<div class="tweet-text">
											<a href="#">Forge is the best ecommerce elt</a>
											<p>Jan 25, 2017</p>
										</div>
									</li>
									<li class="tweet-inner clearfix">
										<div class="tweet-img">
											<a href="#"> <img alt="" src="images/footer/tweet/2.jpg">
											</a>
										</div>
										<div class="tweet-text">
											<a href="#">Forge is the best ecommerce elt</a>
											<p>Jan 25, 2017</p>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom-area">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-sm-6 col-xs-12">
							<div class="copyright">
								<p>Copyright &copy; 2017.Company name All rights reserved.</p>
							</div>
						</div>
						<div class="col-md-5 hidden-sm hidden-xs">
							<nav>
								<ul class="footer-bottom-menu">
									<li><a href="#">Site Map</a></li>
									<li><a href="contact.jsp">Contact Us</a></li>
									<li><a href="">Wish List</a></li>
									<li><a href="#">Newsletter</a></li>
								</ul>
							</nav>
						</div>
						<div class="col-md-3 col-sm-6 col-xs-12">
							<div class="payment-method b-img">
								<img alt="" src="images/footer/footer-bottom.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- End footer area -->
	</div>
	<!-- Body main wrapper end -->

	<!-- Placed js at the end of the document so the pages load faster -->

	<!-- jquery latest version -->
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<!-- Bootstrap framework js -->
	<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
	<!-- All js plugins included in this file. -->
	<script src="js/plugins.js"></script>
	<!-- Google Map js -->
	<script type="text/javascript">
	$(function(){
		var user = "<%=session.getAttribute("logeduser")%>";
		if(user!="null"){
			$("#loged").remove();
				$(".mr-10").html("<%=session.getAttribute("logeduser")%>");
			} else {
				$("#myaccount").remove();
			}

		})
		$("#logintwo").click(function() {
			$.get("LoginTwoServlet", {
				"username" : $(this).prev().prev().prev().prev().val(),
				"password" : $(this).prev().prev().val()
			}, function(result) {
				if (result == "true") {
					alert("登陆成功！");
					location.reload();
				} else {
					alert("登陆失败！");
				}
			});
		});
		$("#user-name").focus(function() {
			$("#SB").css("display", "none");
		});
		$("#user-name").blur(function() {
			if ($(this).val() == "") {
				return true;
			} else {
				$.get("SearchUserNameServlet", {
					"username" : $(this).val()
				}, function(result) {
					if (result == "true") {
						return true;
					} else {
						$("#SB").css("display", "inline");
					}
				});
			}
		});
	</script>
</body>

</html>
