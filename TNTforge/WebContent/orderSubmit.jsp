<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.forge.util.CartUtil"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Order Submit</title>
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


<link rel="stylesheet" type="text/css" href="css/base.css" />
<script type="text/javascript" src="js/jquery_cart.js"></script>
<link rel="stylesheet" type="text/css" href="css/buyConfirm.css" />
<script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="js/unslider.min.js" type="text/javascript"></script>
<script src="js/jiesuan.js"></script>

<script type="text/javascript">
$(function(){
	$("#b1").click(function(){
		  $("#slide").slideToggle();
		});
	$("#p1").click(function(){
		 alert("支付成功！");
		 $.ajax({
 			type:"get",
 			url:"RemoveGoods",
 			success:function(result){			
 			
 			}
 	 });
		$.get("SendMSMServlet", {
		}, function(result) {
			if (result == "true") {
				return true;
			} else {
				$("#SB").css("display", "inline");
			}
		});
		 window.location.href="index.jsp";
		 
		});
})
	window.onload = function() {
		new tab('test4-input-input_tab1-input_tab2', '-');
	}
	function tab(o, s, cb, ev) { //tab换类
		var $ = function(o) {
			return document.getElementById(o)
		};
		var css = o.split((s || '_'));
		if (css.length != 4)
			return;
		this.event = ev || 'onclick';
		o = $(o);
		if (o) {
			this.ITEM = [];
			o.id = css[0];
			var item = o.getElementsByTagName(css[1]);
			var j = 1;
			for (var i = 0; i < item.length; i++) {
				if (item[i].className.indexOf(css[2]) >= 0
						|| item[i].className.indexOf(css[3]) >= 0) {
					if (item[i].className == css[2])
						o['cur'] = item[i];
					item[i].callBack = cb || function() {
					};
					item[i]['css'] = css;
					item[i]['link'] = o;
					this.ITEM[j] = item[i];
					item[i]['Index'] = j++;
					item[i][this.event] = this.ACTIVE;
				}
			}
			return o;
		}
	}
	tab.prototype = {
		ACTIVE : function() {
			var $ = function(o) {
				return document.getElementById(o)
			};
			this['link']['cur'].className = this['css'][3];
			this.className = this['css'][2];
			try {
				$(this['link']['id'] + '_' + this['link']['cur']['Index']).style.display = 'none';
				$(this['link']['id'] + '_' + this['Index']).style.display = 'block';
			} catch (e) {
			}
			this.callBack.call(this);
			this['link']['cur'] = this;
		}
	}
</script>



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
									<li><a href="#"><span class="mr-10">My Account</span><i
											class="fa fa-angle-down"></i></a>
										<ul class="ul-style my-account box-shadow white-bg">
											<li><a href="login.jsp">Login</a></li>
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
									<li><a href="login.jsp"> <span>Login or
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
								</span> <span class="cart-size-value"><strong>Shopping<br>Carts(<span
											id="count"> <%
 	if ((Map) session.getAttribute("goods") != null) {
 		out.print(((HashMap) session.getAttribute("goods")).size());
 	} else
 		out.print(0);
 %>
										</span>) </a>

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
							<h2 class="breadcrumbs-title text-black m-0">FORGE SHOP</h2>
							<ul class="top-page">
								<li><a href="index.jsp">Home</a></li>
								<li>></li>
								<li>Order Submit</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Breadcrumbs Area -->
		<!-- Start page content -->
		<section id="page-content" class="page-wrapper pt-10">
			<!-- Banner Area Start -->
			<!-- Banner Area End -->
			<!-- Start Shop View Area -->
			<!-- End Shop View Area -->
			<!-- Start Product List -->
			<div class="product-list-tab modify-tnm">
				<div class="container">
					<div class="row rp-style-2">
						<div class="product-list tab-content">
							<div role="tabpanel" class="tab-pane fade in active" id="home">
								<div class="product-container-list rp-style-2">


									<div class="border_top_cart">

										<div class="container payment-con">
											<form target="_blank" action="#" id="pay-form" method="post">
												<div class="order-info">
													<div class="msg">
														<h3>您的订单已提交成功！付款咯～</h3>
														<p></p>

														<p class="post-date">成功付款后，7天发货</p>
													</div>
													<div class="info">
														<p>
															金额：<span class="count">0</span>元
														</p>
														<p>订单：1150505740045173</p>
														<p>
															配送：潘骏杰 <span class="line">/</span> 159****6437 <span
																class="line">/</span> 江苏,无锡市,北塘区 民丰西苑82号202室 <span
																class="line">/</span> 不限送货时间 <span class="line">/</span>
															个人电子发票
														</p>
														<script><%request.setCharacterEncoding("utf-8");%>   </script>
														<p>
															买家留言：<%=request.getParameter("board")%>
														</p>
														<input id="b1" type="button" value="点击查看订单详情->"
															style="background-color: white; padding-left: 0;">

														<div id="slide" style="display: none">

															<dl class="checkout-goods-list">

																<dt class="clearfix">
																	<span class="col col-1">商品名称</span> <span
																		class="col col-2">购买价格</span> <span class="col col-3">购买数量</span>
																	<span class="col col-4">小计（元）</span>
																</dt>


																<%
																	if ((Map) session.getAttribute("goods") != null) {
																		int goodKind = 0;
																		Map<String, Integer> gods = new HashMap<String, Integer>();
																		gods = (HashMap) session.getAttribute("goods");
																		goodKind = gods.size();
																		String[] goodName = new String[goodKind];
																		int[] goodNum = new int[goodKind];
																		Set<Map.Entry<String, Integer>> set = gods.entrySet();//实现Map遍历
																		Iterator<Map.Entry<String, Integer>> iter = set.iterator();
																		int n = 0;
																		while (iter.hasNext()) {
																			Map.Entry<String, Integer> me = iter.next();
																			System.out.println(me.getKey() + "=" + me.getValue());
																			goodName[n] = me.getKey();
																			goodNum[n] = me.getValue();
																			n++;
																		}

																		for (int i = 0; i < goodKind; i++) {
																			CartUtil price = new CartUtil();
																			String good = price.checkGoods(goodName[i]);
																			int p = Integer.parseInt(good);
																%>
																<dd class="item clearfix">
																	<div>
																		<div class="col col-1">
																			<%
																				out.print(goodName[i]);
																			%>
																		</div>
																		<div class="col col-2">
																			<span> <%
 	out.print(p);
 %>
																			</span>元
																		</div>
																		<div class="col col-3">
																			<%
																				out.print(goodNum[i]);
																			%>
																		</div>
																		<div class="col col-4">
																			<span class="total"> <%
 	out.print(goodNum[i] * p);
 %>
																			</span>
																		</div>
																	</div>
																</dd>
																<%
																	}
																	}
																%>



															</dl>

														</div>


													</div>
													<div class="icon-box">
														<i class="iconfont"><img src="images/yes_ok.png"></i>
													</div>
												</div>

												<div class="xm-plain-box">
													<!-- 选择支付方式 -->
													<div class="box-hd bank-title clearfix">
														<div id="titleWrap" class="title-wrap">
															<h2 class="title">选择支付方式</h2>
															<h2 class="title hide ">
																你还需要继续支付 <em>49.00</em> 元
															</h2>
															<span class="tip-tag"></span>
														</div>
													</div>
													<div class="box-bd" id="bankList">
														<div class="payment-bd">
															<form name="ck">
																<dl class="clearfix payment-box">
																	<dt>
																		<strong>支付平台</strong>
																		<p>手机等大额支付推荐使用支付宝快捷支付</p>
																	</dt>
																	<dd>
																		<fieldset id="test4-input-input_tab1-input_tab2"
																			style="border: none;">
																			<ul class="payment-list clearfix">
																				<li><label><input type="radio"
																						name="myradio" id="r2" value="zfb" /> <img
																						src="images/zfb.png" alt="" /></label></li>
																				<li><label><input type="radio"
																						name="myradio" id="r2" value="yck" /> <img
																						src="images/yck.png" alt="" /></label></li>
																				<li><label><input type="radio"
																						name="myradio" id="r2" value="zxzf" /> <img
																						src="images/zxzf.png" alt="" /></label></li>
																			</ul>
																		</fieldset>
																	</dd>
																</dl>
															</form>

															<dl class="clearfix payment-box">
																<dt>
																	<strong>银行网银</strong>
																	<p>支持以下各银行借记卡及信用卡</p>

																</dt>
																<dd>
																	<ul class="payment-list clearfix">
																		<li><label for="CMB"><input type="radio"
																				name="myradio" id="CMB" value="CMB" /> <img
																				src="http://s1.mi.com/images/payOnline_zsyh.gif"
																				alt="" /></label></li>
																		<li><label for="ICBCB2C"><input
																				type="radio" name="myradio" id="ICBCB2C"
																				value="ICBCB2C" /> <img
																				src="http://s1.mi.com/images/payOnline_gsyh.gif"
																				alt="" /></label></li>
																		<li><label for="CCB"><input type="radio"
																				name="myradio" id="CCB" value="CCB" /> <img
																				src="http://s1.mi.com/images/payOnline_jsyh.gif"
																				alt="" /></label></li>
																		<li><label for="ABC"><input type="radio"
																				name="myradio" id="ABC" value="ABC" /> <img
																				src="http://s1.mi.com/images/payOnline_nyyh.gif"
																				alt="" /></label></li>
																		<li><label for="BOCB2C"><input
																				type="radio" name="myradio" id="BOCB2C"
																				value="BOCB2C" /> <img
																				src="http://s1.mi.com/images/payOnline_zgyh.gif"
																				alt="" /></label></li>
																		<li><label for="COMM"><input type="radio"
																				name="myradio" id="COMM" value="COMM" /> <img
																				src="http://s1.mi.com/images/payOnline_jtyh.gif"
																				alt="" /></label></li>
																		<li><label for="PSBC-DEBIT"><input
																				type="radio" name="myradio" id="PSBC-DEBIT"
																				value="PSBC-DEBIT" /> <img
																				src="http://s1.mi.com/images/payOnline_youzheng.gif"
																				alt="" /></label></li>
																		<li><label for="GDB"><input type="radio"
																				name="myradio" id="GDB" value="GDB" /> <img
																				src="http://s1.mi.com/images/payOnline_gfyh.gif"
																				alt="" /></label></li>
																		<li><label for="SPDB"><input type="radio"
																				name="myradio" id="SPDB" value="SPDB" /> <img
																				src="http://s1.mi.com/images/payOnline_pufa.gif"
																				alt="" /></label></li>
																		<li><label for="CEBBANK"><input
																				type="radio" name="myradio" id="CEBBANK"
																				value="CEBBANK" /> <img
																				src="http://s1.mi.com/images/payOnline_gdyh.gif"
																				alt="" /></label></li>
																		<li><label for="SPABANK"><input
																				type="radio" name="myradio" id="SPABANK"
																				value="SPABANK" /> <img
																				src="http://s1.mi.com/images/payOnline_payh.gif"
																				alt="" /></label></li>
																		<li><label for="CIB"><input type="radio"
																				name="myradio" id="CIB" value="CIB" /> <img
																				src="http://s1.mi.com/images/payOnline_xyyh.gif"
																				alt="" /></label></li>
																		<li><label for="CMBC"><input type="radio"
																				name="myradio" id="CMBC" value="CMBC" /> <img
																				src="http://s1.mi.com/images/payOnline_msyh.gif"
																				alt="" /></label></li>
																		<li><label for="BOB"><input type="radio"
																				name="myradio" id="BOB" value="BOB" /> <img
																				src="http://s1.mi.com/images/payOnline_bjyh.gif"
																				alt="" /></label></li>
																		<li><label for="CITIC"><input
																				type="radio" name="myradio" id="CITIC" value="CITIC" />
																				<img
																				src="http://s1.mi.com/images/payOnline_zxyh.gif"
																				alt="" /></label></li>
																		<li><label for="SDB"><input type="radio"
																				name="myradio" id="SDB" value="SDB" /> <img
																				src="http://s1.mi.com/images/payOnline_sfyh.gif"
																				alt="" /></label></li>
																		<li><label for="SHBANK"><input
																				type="radio" name="myradio" id="SHBANK"
																				value="SHBANK" /> <img
																				src="http://s1.mi.com/images/payOnline_shyh.gif"
																				alt="" /></label></li>
																		<li><label for="BJRCB"><input
																				type="radio" name="myradio" id="BJRCB" value="BJRCB" />
																				<img
																				src="http://s1.mi.com/images/payOnline_bjnsyh.gif"
																				alt="" /></label></li>
																		<li><label for="NBBANK"><input
																				type="radio" name="myradio" id="NBBANK"
																				value="NBBANK" /> <img
																				src="http://s1.mi.com/images/payOnline_nbyh.gif"
																				alt="" /></label></li>
																		<li><label for="HZCBB2C"><input
																				type="radio" name="myradio" id="HZCBB2C"
																				value="HZCBB2C" /> <img
																				src="http://s1.mi.com/images/payOnline_hzyh.gif"
																				alt="" /></label></li>
																		<li><label for="SHRCB"><input
																				type="radio" name="myradio" id="SHRCB" value="SHRCB" />
																				<img
																				src="http://s1.mi.com/images/payOnline_shnsyh.gif"
																				alt="" /></label></li>
																		<li><label for="FDB"><input type="radio"
																				name="myradio" id="FDB" value="FDB" /> <img
																				src="http://s1.mi.com/images/payOnline_fcyh.gif"
																				alt="" /></label></li>
																	</ul>
																</dd>
															</dl>




														</div>
													</div>
													<div class="box-ft clearfix">
														<a href="index.jsp"><input type="button"
															class="btn btn-primary" value="确认支付" id="p1"></a> <a
															href="shoppingcarts.jsp" class="btn btn-lineDakeLight">修改订单</a>
														<span class="tip"></span>
													</div>
												</div>
											</form>
										</div>
										<!-- 支付弹框 -->
										<div class="modal hide to-pay-tip" id="toPayTip">
											<div class="modal-header">
												<span class="close" id="toPayTipClose"> <i
													class="iconfont">&#xe617;</i>
												</span>
												<h3>正在支付...</h3>
											</div>
											<div class="modal-body">
												<div class="pay-tip clearfix">
													<div class="fail">
														<h4>如果支付失败...</h4>
														<p>
															额度问题，推荐<a href="#" id="alipayTrigger">支付宝快捷支付 &gt;</a>
														</p>
														<p>
															其他问题，查看<a href="#">支付常见问题 &gt;</a>
														</p>
													</div>
													<div class="success">
														<h4>支付成功了</h4>
														<p>
															立即查看<a href="#" target="_blank">订单详情 &gt;</a>
														</p>
													</div>
												</div>
											</div>
										</div>
										<!-- 余额支付弹框 -->
										<div class="modal hide  balance-pay" id="balancePay">
											<div class="modal-body">
												<h3>
													账户余额支付：<span class="num"><em
														id="useCashAccountPayLeft">0.00</em>元</span>
												</h3>
												<p id="checkCodeTip">
													短信验证码已下发至您的手机<span class="num"></span>
												</p>
												<input type="text" name="verifycode" id="verifycode"
													class="input" placeholder="请输入验证码"> <span
													class="send-again" id="sendAgain">重新发送<em></em></span>
												<p>
													<input type="button" value="确认支付" class="btn btn-primary"
														id="toPay">
												<div class="select-other">
													<p>
														<span id="bankName"></span> <span class="num">49.00元</span>
													</p>

												</div>
												<a href="javascript:;" id="chooseOther">选择其他方式支付&gt;</a>
											</div>

										</div>



										<script src="js/base.min.js"></script>

										<script type="text/javascript" src="js/buyConfirm.js"></script>
									</div>


								</div>
							</div>
							<div role="tabpanel" class="tab-pane fade modify2" id="menu1">
								<div
									class="product-container-list product-container-list-full rp-style-2">
									<div class="cp-style-2 mt-30">
										<div class="product-inner-list clearfix">
											<div class="product-img-list">
												<a href="#">
													<div class="product-img b-img">
														<img alt="" src="images/product/arrival/1.jpg">
													</div>
												</a> <span class="product-tag text-uppercase black-bg">new</span>
											</div>
											<div class="product-text product-text-list gray-ash-bg">
												<h5 class="product-name-list">
													<a title="Montria jastma" href="#"><strong>Montria
															jastma</strong></a>
												</h5>
												<ul class="pull-left list-inline ratings rating-list pb-20">
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li class="reviews text-theme"><span>10</span>Review(s)</li>
												</ul>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit, sed do eiusmod tempor incididunt ut labore et dolore
													magna aliqua. Ut enim ad minim veniam, quis nostrud
													exercitation ullamco laboris nisi ut aliquip ex ea commodo
													consequat pariatur</p>
												<ul class="pricing pricing-list">
													<li class="text-right p-price text-center">$180</li>
													<li class="text-right c-price text-defualt text-center">$150</li>
												</ul>
												<div class="clear"></div>
												<ul class="quick-veiw-list">
													<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
													<li><a href="#"><i class="fa fa-eye"></i></a></li>
													<li><a href="#"><i class="fa fa-refresh"></i></a></li>
													<li><a href="#"><i class="fa fa-heart"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="cp-style-2 mt-30">
										<div class="product-inner-list clearfix">
											<div class="product-img-list">
												<a href="#">
													<div class="product-img b-img">
														<img alt="" src="images/product/arrival/2.jpg">
													</div>
												</a> <span class="product-tag text-uppercase theme-bg">sale</span>
											</div>
											<div class="product-text product-text-list gray-ash-bg">
												<h5 class="product-name-list">
													<a title="Zelletria ostma" href="#"><strong>Zelletria
															ostma</strong></a>
												</h5>
												<ul class="pull-left list-inline ratings rating-list pb-20">
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li class="reviews text-theme"><span>10</span>Review(s)</li>
												</ul>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit, sed do eiusmod tempor incididunt ut labore et dolore
													magna aliqua. Ut enim ad minim veniam, quis nostrud
													exercitation ullamco laboris nisi ut aliquip ex ea commodo
													consequat pariatur</p>
												<ul class="pricing pricing-list">
													<li class="text-right p-price text-center">$220</li>
													<li class="text-right c-price text-defualt text-center">$195</li>
												</ul>
												<div class="clear"></div>
												<ul class="quick-veiw-list">
													<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
													<li><a href="#"><i class="fa fa-eye"></i></a></li>
													<li><a href="#"><i class="fa fa-refresh"></i></a></li>
													<li><a href="#"><i class="fa fa-heart"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="cp-style-2 mt-30">
										<div class="product-inner-list clearfix">
											<div class="product-img-list">
												<a href="#">
													<div class="product-img b-img">
														<img alt="" src="images/product/arrival/3.jpg">
													</div>
												</a>
											</div>
											<div class="product-text product-text-list gray-ash-bg">
												<h5 class="product-name-list">
													<a title="Letria postma" href="#"><strong>Letria
															postma</strong></a>
												</h5>
												<ul class="pull-left list-inline ratings rating-list pb-20">
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li class="reviews text-theme"><span>10</span>Review(s)</li>
												</ul>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit, sed do eiusmod tempor incididunt ut labore et dolore
													magna aliqua. Ut enim ad minim veniam, quis nostrud
													exercitation ullamco laboris nisi ut aliquip ex ea commodo
													consequat pariatur</p>
												<ul class="pricing pricing-list">
													<li class="text-right p-price text-center">$160</li>
													<li class="text-right c-price text-defualt text-center">$140</li>
												</ul>
												<div class="clear"></div>
												<ul class="quick-veiw-list">
													<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
													<li><a href="#"><i class="fa fa-eye"></i></a></li>
													<li><a href="#"><i class="fa fa-refresh"></i></a></li>
													<li><a href="#"><i class="fa fa-heart"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="cp-style-2 mt-30">
										<div class="product-inner-list clearfix">
											<div class="product-img-list">
												<a href="#">
													<div class="product-img b-img">
														<img alt="" src="images/product/arrival/4.jpg">
													</div>
												</a> <span class="product-tag text-uppercase orang-bg">-20%</span>
											</div>
											<div class="product-text product-text-list gray-ash-bg">
												<h5 class="product-name-list">
													<a title="Montria jastma" href="#"><strong>Montria
															jastma</strong></a>
												</h5>
												<ul class="pull-left list-inline ratings rating-list pb-20">
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li class="reviews text-theme"><span>10</span>Review(s)</li>
												</ul>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit, sed do eiusmod tempor incididunt ut labore et dolore
													magna aliqua. Ut enim ad minim veniam, quis nostrud
													exercitation ullamco laboris nisi ut aliquip ex ea commodo
													consequat pariatur</p>
												<ul class="pricing pricing-list">
													<li class="text-right p-price text-center">$160</li>
													<li class="text-right c-price text-defualt text-center">$140</li>
												</ul>
												<div class="clear"></div>
												<ul class="quick-veiw-list">
													<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
													<li><a href="#"><i class="fa fa-eye"></i></a></li>
													<li><a href="#"><i class="fa fa-refresh"></i></a></li>
													<li><a href="#"><i class="fa fa-heart"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
									<div class="cp-style-2 mt-30">
										<div class="product-inner-list clearfix">
											<div class="product-img-list">
												<a href="#">
													<div class="product-img b-img">
														<img alt="" src="images/product/arrival/5.jpg">
													</div>
												</a> <span class="product-tag text-uppercase black-bg">new</span>
											</div>
											<div class="product-text product-text-list gray-ash-bg">
												<h5 class="product-name-list">
													<a title="Metria ostma" href="#"><strong>Metria
															ostma</strong></a>
												</h5>
												<ul class="pull-left list-inline ratings rating-list pb-20">
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li><i class="rated fa fa-star"></i></li>
													<li class="reviews text-theme"><span>10</span>Review(s)</li>
												</ul>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit, sed do eiusmod tempor incididunt ut labore et dolore
													magna aliqua. Ut enim ad minim veniam, quis nostrud
													exercitation ullamco laboris nisi ut aliquip ex ea commodo
													consequat pariatur</p>
												<ul class="pricing pricing-list">
													<li class="text-right p-price text-center">$160</li>
													<li class="text-right c-price text-defualt text-center">$140</li>
												</ul>
												<div class="clear"></div>
												<ul class="quick-veiw-list">
													<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
													<li><a href="#"><i class="fa fa-eye"></i></a></li>
													<li><a href="#"><i class="fa fa-refresh"></i></a></li>
													<li><a href="#"><i class="fa fa-heart"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Product List -->
			<!-- Start Shop View Area -->
			<!-- End Shop View Area -->
			<!-- Start Brand Area -->
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
