<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Login / Register</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<script language="javascript" type="text/javascript">  
   var code ; //在全局 定义验证码   
    function createCode(){    
    code = "";    
    var codeLength = 5;//验证码的长度    
    //所有候选组成验证码的字符，可以用中文    
    var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C',  
            'D','E','F','G','H','I','J','K','L','M','N','O','P',  
            'Q','R','S','T','U','V','W','X','Y','Z','a','b','c',  
            'd','e','f','g','h','i','j','k','l','m','n','o','p',  
            'q','r','s','t','u','v','w','x','y','z');    
    for(var i=0;i<codeLength;i++){    
        var charIndex = Math.floor(Math.random()*60);    
        code +=selectChar[charIndex];    
    }    
    return code;    
}    
function validate (){    
    var inputCode = document.getElementById("vcode").value.toLowerCase();    
    if(inputCode.length <=0){    
        alert("请输入验证码！");    
        return false;    
    }    
    else if(inputCode != code.toLowerCase()){    
        alert("验证码输入错误！");    
        show();//刷新验证码    
        return false;    
    }else{    
        return true;    
    }    
}    
function show(){    
        //显示验证码    
        document.getElementById("code").src="CodeServlet?code="+createCode();    
}    
window.onload = function() {  
        //document.onload=show();    
        show();//页面加载时加载验证码    
        //这时无论在ie还是在firefox中，js没有加载完，页面的东西是不会被执行的；    
    } 
</script>  
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
									<li id="myaccount"><a href="#"><span class="mr-10">My Account</span><i
											class="fa fa-angle-down"></i></a>
										<ul class="ul-style my-account box-shadow white-bg">
											<li><a href="LogOutservlet">Log Out</a></li>
											<li><a href="LogOutservlet">My Account</a></li>
										</ul></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3 col-xs-6">
							<div class="header-top-middle">
								<ul class="header-top-style">
									<li id="loged"><a href="login.jsp"> <span>Login or
												Register</span>
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
											<button value="submit" class="btn-default"  id="logintwo">Login</button>
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
						<div class="col-md-offset-0 col-md-5 col-sm-offset-0 col-sm-4 col-xs-offset-3 col-xs-6">
                            <div class="shopping-cart">
                                <a href="#">
                                    <span class="shopping-cart-control">
                                        <img alt="" src="images/shop.png">
                                    </span>
                                    <a href="shoppingcarts.jsp"><span class="cart-size-value"><strong>Shopping<br>Carts(<span id="count"><%  if((Map)session.getAttribute("goods")!=null){
                                        out.print(((HashMap)session.getAttribute("goods")).size());}
                                    else out.print(0);
                                        %></span>)</strong></span></a>
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
							<h2 class="breadcrumbs-title text-black m-0">Login /
								Register</h2>
							<ul class="top-page">
								<li><a href="index.jsp">Home</a></li>
								<li>></li>
								<li>Login / Register</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs Area -->
		<!-- Start page content -->
		<section id="page-content" class="page-wrapper pt-10">
			<!-- Start Register Area -->
			<div class="register-area pt-90">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="registered-customers">
								<h4 class="text-uppercase mb-20">
									<strong>REGISTERED CUSTOMERS</strong>
								</h4>
								<form action="LoginOneServlet" method="post" onsubmit="return validate();">
									<div class="login-account p-30 box-shadow">
										<p>If you have an account with us, Please log in.</p>
										<input id="remname" type="text" placeholder="Username" name="name">
										<input id="rempass" type="password" placeholder="Password" name="password">
										<input type="checkbox" name="rempass">Remember Password
										<input type="text" id="vcode" maxLength="5"
											placeholder="Input the Checkcode" >
										<img id="code" src="">
										<a href="#" mce_href="#"  
                                         onclick="javascript:show();return false;">Unclear?</a>
										<input id="login_buttom"  type="submit"
											value="Login">
										<br>
										<%
											if (null != session.getAttribute("error")) {
												out.print(session.getAttribute("error"));
												session.removeAttribute("error");
											}
										%>
										<p>
										<br>
											<small>Forget Password?</small><br><br>
											<small><a href="forgotPwd.jsp">Email Found</a></small><br>
											<small><a href="PhoneCode.jsp">Phone Found</a></small>
										</p>
									</div>
								</form>
							</div>
						</div>
						<div class="col-md-6">
							<div class="registered-customers new-customers">
								<div class="section-title text-uppercase mb-40">
									<h4>NEW CUSTOMERS</h4>
								</div>
								<form action="ResgistServlet" method="post" name="resgistform"
									onsubmit="return checksubmit()">
									<div class="login-account p-30 box-shadow">
									<div>
												<input type="text" placeholder="Your Name" name="uname"><span id="mess"></span>
										</div>
										ChooseYour
										Gender:&nbsp;&nbsp; <input type="radio" name="ugender" value="Male">Male&nbsp;
										<input type="radio" name="ugender" value="Female">Female&nbsp;
										<input type="radio" name="ugender" value="NotClear">
										Secret <input type="date" placeholder="Your BirthDay"
											name="ubirth">	
										<input type="text" placeholder="Phone here..." name="utel"><span id="mess2"></span>
										<input type="email" placeholder="Email here..." name="uemail"><span id="mess3"></span>
										<input type="password" placeholder="Password" name="upsw"
											class="upsw"> <span id="mess4"></span>
										<input type="password"
											placeholder="Confirm Password" class="confirmpsw"
											name="ucfmpsw">
										<div>
											<span class="cpwrong"></span>
										</div>
										<div class="checkbox">
											<label class="mr-10"> <small> <input
													type="checkbox" name="signup">Sign up for our
													newsletter!
											</small>
											</label> <label> <small> <input type="checkbox"
													name="signup">Receive special offers from our
													partners!
											</small>
											</label>
										</div>
										<div class="row">
											<div class="col-md-6">
												<button value="register" type="submit"
													class="cart-button text-uppercase mt-20">Register</button>
											</div>
											<div class="col-md-6">
												<button type="reset"
													class="cart-button text-uppercase mt-20">Clear</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End of Register Area -->
			<!-- Start Brand Area -->
			<div class="brand-area section-padding">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="section-title text-center mb-35">
								<h2 class="text-uppercase">
									<strong>OUR BRAND</strong>
								</h2>
								<p class="text-defualt">BRAND</p>
								<img alt="" src="images/section-border.png">
							</div>
							<div class="brand-carousel">
								<div class="col-md-12">
									<div class="single-brand text-center">
										<a href="#"> <img src="images/brand/1.png" alt="">
										</a>
									</div>
								</div>
								<div class="col-md-12">
									<div class="single-brand text-center">
										<a href="#"> <img src="images/brand/2.png" alt="">
										</a>
									</div>
								</div>
								<div class="col-md-12">
									<div class="single-brand text-center">
										<a href="#"> <img src="images/brand/3.png" alt="">
										</a>
									</div>
								</div>
								<div class="col-md-12">
									<div class="single-brand text-center">
										<a href="#"> <img src="images/brand/4.png" alt="">
										</a>
									</div>
								</div>
								<div class="col-md-12">
									<div class="single-brand text-center">
										<a href="#"> <img src="images/brand/5.png" alt="">
										</a>
									</div>
								</div>
								<div class="col-md-12">
									<div class="single-brand text-center">
										<a href="#"> <img src="images/brand/1.png" alt="">
										</a>
									</div>
								</div>
								<div class="col-md-12">
									<div class="single-brand text-center">
										<a href="#"> <img src="images/brand/2.png" alt="">
										</a>
									</div>
								</div>
								<div class="col-md-12">
									<div class="single-brand text-center">
										<a href="#"> <img src="images/brand/3.png" alt="">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Brand Area -->
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
	<!-- Main js file that contents all jQuery plugins activation. -->
	<script src="js/main.js"></script>
	<script>
		function checksubmit() {
			var username=document.resgistform.uname.value;
			var address=document.resgistform.address.value;
			var tel=document.resgistform.utel.value;
			var pass = document.resgistform.upsw.value;
			var pass1 = document.resgistform.ucfmpsw.value;
			if (username==0) {
				$("#mess").css({'color':'pink','font-size':'15px'}).html("Username cannot be null");
				return false;
			} else if (tel==0) {
				$("#mess2").css({'color':'pink','font-size':'15px'}).html("Telephone cannot be null");
				return false;
			} else if (pass==0) {
				$("#mess4").css({'color':'pink','font-size':'15px'}).html("Password cannot be null");
				return false;
			}else if (pass!==pass1) {
				$(".cpwrong").css({'color':'pink','font-size':'15px'}).html("Password Not The Same!");
				return false;
			}else {
				alert("注册成功,正在前往主页！");
				return true;
			}
		}

		$(function() {
			$(".confirmpsw").keyup(function() {
				$.ajax({
					type : "get",
					url : "PasswordConfirmServlet",
					data : {
						"upsw" : $(this).prev().prev().prop("value"),
						"ucfmpsw" : $(this).prop("value")
					},
					success : function(result) {
						if (result == 0) {
							$('.cpwrong').css({
								'color' : 'pink',
								'font-size' : '15px'
							}).html("Password Not The Same!");
						} else {
							$('.cpwrong').html("");
						}
					}
				})
			})
			
			$("input[name='uname']").blur(function(){
				$('#mess').html("");
				var reg=/^[a-zA-Z0-9_]{3,16}$/;
				if(!reg.test($(this).prop("value"))){
					$("#mess").css({'color':'pink','font-size':'15px'}).html("Username length cannot be less than 3");
				}
			})
			$("input[name='utel']").blur(function(){
				$('#mess2').html("");
				var reg=/^1[3,5,7,8]\d{9}$/;
				if(!reg.test($(this).prop("value"))){
					$("#mess2").css({'color':'pink','font-size':'15px'}).html("Wrong number");
				}
			})
			$("input[name='uemail']").blur(function(){
				$('#mess3').html("");
				var reg=/^[a-z0-9]+@([a-z0-9]+\.)+[a-z]{2,4}$/i;
				if(!reg.test($(this).prop("value"))){
					$("#mess3").css({'color':'pink','font-size':'15px'}).html("Wrong Email");
				}
			})
			$('.upsw').keyup(function(e) {
				 var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
				 var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
				 var enoughRegex = new RegExp("(?=.{6,}).*", "g");
				 if (false == enoughRegex.test($(this).val())) {
			     $("#mess4").css({'color':'pink','font-size':'15px'}).html('More Characters');
				 } else if (strongRegex.test($(this).val())) {
				 $("#mess4").css({'color':'pink','font-size':'15px'}).html('Strong!');
				 } else if (mediumRegex.test($(this).val())) {
				 $("#mess4").css({'color':'pink','font-size':'15px'}).html('Medium!');
				 } else {
				 $("#mess4").css({'color':'pink','font-size':'15px'}).html('Weak!');
				 }
				 return true;
				});
		})
	</script>
		<script type="text/javascript">
	$(function(){
		var user = "<%=session.getAttribute("logeduser")%>";
		if(user!="null"){
			$("#loged").remove();
				$(".mr-10").html("<%=session.getAttribute("logeduser")%>");
			}else{
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
	<%
		Cookie[] ck = request.getCookies();
		String name="";
		String pass="";
			if (ck != null) {
			for (int i = 0; i < ck.length; i++) {
				if (ck[i].getName().equals("cname")) {
					name=ck[i].getValue();
				}
				if (ck[i].getName().equals("cpass")) {
					pass=ck[i].getValue();
				}
			}
		}
	%>
	<script type="text/javascript">
		$(function(){
			var rname="<%=name%>";
			var rpass="<%=pass%>";
			$('#remname').attr('value',rname);
			$('#rempass').attr('value',rpass);
		})
	</script>
</body>

</html>