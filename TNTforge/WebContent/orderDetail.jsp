<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Order Detail</title>
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
<script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/jiesuan.js"></script>
<link rel="stylesheet" type="text/css" href="css/checkOut.css" />



<!-- Modernizr JS -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
<script>
$(function(){
	 $("#J_editAddrOk").click(function(){
		 if($("#Consignee").prop("value").length==0||$("#Telephone").prop("value").length<=10||$("#Street").prop("value").length==0||$("#Tag").prop("value").length==0){
			 alert("请按要求填写")
		 }
		 else{
		$.ajax({
			type:"get",
			url:"AddressServlet",
			data:{"province":$("#Provinces option:selected").text(),
				"city":$("#Citys  option:selected").text(), 
				"county":$("#Countys option:selected").text(),
				"receiver":$("#Consignee").prop("value"),
				"receivertel":$("#Telephone").prop("value"),
				"extra":$("#Street").prop("value"),
				"tag":$("#Tag").prop("value"),
				},
			success:function(result){
			
				var rst = result.split(",");
				
						
			 if(result!=null){
				var msg="<dl class='item'>";
			msg+="<dt>";
			
			
				msg+="<strong class='itemConsignee'>"+rst[0]+"</strong> <span";
				msg+="	class='itemTag tag'>"+rst[3]+"</span>";
				msg+="</dt>";
					msg+="<dd>";
						msg+="<p class='tel itemTel'>"+rst[1]+"</p>";
						msg+="<p class='itemRegion'>"+rst[4]+"&nbsp"+rst[5]+"&nbsp"+rst[6]+"</p>";
						msg+="<p class='itemStreet'>"+rst[2]+"</p>";
						msg+="<span class='edit-btn J_editAddr'>编辑</span>";
						msg+="</dd>";
							msg+="<dd style='display: none'>";
							msg+="<input type='radio' name='Checkout[address]'";
								msg+="class='addressId' value='10140916720030323'>";
								msg+="</dd>";
								msg+="</dl>";
				$("#J_editAddrCancel").text("返回");
				$("#J_editAddrOk").text("");
				 $("#J_editAddrOk").attr("disabled",true);
				$("#J_editAddrOk").css("background","url(images/12030.png)")
				$("#J_editAddrOk").css("border-style","none")
		
				$("#checkoutAddrList").append(msg);
				 $("#J_editAddrCancel").click(function(){
					 $("#J_editAddrOk").css("background","")	
					 $("#J_editAddrOk").attr("disabled",false);
					 $("#J_editAddrOk").text("确认")
					 $("#J_editAddrCancel").text("取消");
				 })
					 
			 } 
			 
			}
		})
	 }
	 })
})
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
											<button  id="logintwo" value="submit" class="btn-default">Login</button>
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
								</span> <span class="cart-size-value"><strong>Shopping<br>Carts(<span id="count"><%  if((Map)session.getAttribute("goods")!=null){
                                        out.print(((HashMap)session.getAttribute("goods")).size());}
                                    else out.print(0);
                                        %></span>)
									
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
							<h2 class="breadcrumbs-title text-black m-0">FORGE SHOP</h2>
							<ul class="top-page">
								<li><a href="index.jsp">Home</a></li>
								<li>></li>
								<li>Order Detail</li>
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
										<script type="text/javascript">
											var checkoutConfig = {
												addressMatch : 'common',
												addressMatchVarName : 'data',
												hasPresales : false,
												hasBigTv : false,
												hasAir : false,
												hasScales : false,
												hasGiftcard : false,
												totalPrice : 244.00,
												postage : 10,//运费
												postFree : true,//活动是否免邮了
												bcPrice : 150,//计算界值
												activityDiscountMoney : 0.00,//活动优惠
												showCouponBox : 0,
												invoice : {
													NA : "0",
													personal : "1",
													company : "2",
													electronic : "4"
												}
											};
											var miniCartDisable = true;
										</script>
										<div class="container">
											<div class="checkout-box">
												<form id="checkoutForm" action="orderSubmit.jsp"
													method="post">
													<div class="checkout-box-bd">
														<!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
														<input type="hidden" name="Checkout[addressState]"
															id="addrState" value="0">
														<!-- 收货地址 -->
														<div class="xm-box">
															<div class="box-hd ">
																<h2 class="title">收货地址</h2>
																<!---->
															</div>
															
															<div class="box-bd" style="display:hidden">
																<div class="clearfix xm-address-list"
																	>
																	<div id="checkoutAddrList">
																	<dl class="item">
																	<div>
																		<dt>
																			<strong class="itemConsignee">蔡英杰</strong> <span
																				class="itemTag tag">学校</span>
																		</dt>
																		<dd>
																			<p class="tel itemTel">15961726437</p>
																			<p class="itemRegion">江苏 苏州市 工业园区</p>
																			<p class="itemStreet">民丰西苑82号202室</p>
																			<span class="edit-btn J_editAddr">编辑</span>
																		</dd>
																		</div>
																		<dd style="display: none">
																			<input type="radio" name="Checkout[address]"
																				class="addressId" value="10140916720030323">
																		</dd>
																	</dl>
																	
																
																	
																	</div>
															
															
															
															
															
																	

																	<div class="item use-new-addr" id="J_useNewAddr"
																		data-state="off">
																		<span class="iconfont icon-add"><img
																			src="images/add_cart.png" /></span> 使用新地址
																	</div>
																</div>
																<input type="hidden" name="newAddress[type]"
																	id="newType" value="common"> <input
																	type="hidden" name="newAddress[consignee]"
																	id="newConsignee"> <input type="hidden"
																	name="newAddress[province]" id="newProvince"> <input
																	type="hidden" name="newAddress[city]" id="newCity">
																<input type="hidden" name="newAddress[district]"
																	id="newCounty"> <input type="hidden"
																	name="newAddress[address]" id="newStreet"> <input
																	type="hidden" name="newAddress[zipcode]"
																	id="newZipcode"> <input type="hidden"
																	name="newAddress[tel]" id="newTel"> <input
																	type="hidden" name="newAddress[tag_name]" id="newTag">
																<!--点击弹出新增/收货地址界面start-->

																<div class="xm-edit-addr-box" id="J_editAddrBox">
																	
																		<div class="bd">
																			<div class="item">
																				<label>收货人姓名<span>*</span></label> <input
																					type="text" name="userAddress[consignee]"
																					id="Consignee" class="input" placeholder="收货人姓名"
																					maxlength="15" autocomplete='off'>
																				<p class="tip-msg tipMsg"></p>
																			</div>
																			<div class="item">
																				<label>联系电话<span>*</span></label> <input type="text"
																					name="userAddress[tel]" class="input"
																					id="Telephone" placeholder="11位手机号"
																					autocomplete='off'>
																				<p class="tel-modify-tip" id="telModifyTip"></p>
																				<p class="tip-msg tipMsg"></p>
																			</div>
																			<div class="item">
																				<label>地址<span>*</span></label> <select
																					name="userAddress[province]" id="Provinces"
																					class="select-1">
																					<option>省份/自治区</option>
																				</select> <select name="userAddress[city]" id="Citys"
																					class="select-2" disabled>
																					<option  >城市/地区/自治州</option>
																				</select> <select name="userAddress[county]" id="Countys"
																					class="select-3" disabled>
																					<option>区/县</option>
																				</select>
																				<textarea name="userAddress[street]"
																					class="input-area" id="Street"
																					placeholder="路名或街道地址，门牌号"></textarea>
																				<p class="tip-msg tipMsg"></p>
																			</div>
																			<div class="item">
																				<label>邮政编码<span>*</span></label> <input type="text"
																					name="userAddress[zipcode]" id="Zipcode"
																					class="input" placeholder="邮政编码" autocomplete='off'>
																				<p class="zipcode-tip" id="zipcodeTip"></p>
																				<p class="tip-msg tipMsg"></p>
																			</div>
																			<div class="item">
																				<label>地址标签<span>*</span></label> <input type="text"
																					name="userAddress[tag]" id="Tag" class="input"
																					placeholder='地址标签：如"家"、"公司"。限5个字内'>
																				<p class="tip-msg tipMsg"></p>
																			</div>
																		</div>
																		<div class="ft clearfix">
																			<button type="button" style="background-color:#1E90FF"
																				class="btn btn-lineDake btn-small "
																				id="J_editAddrCancel">取消</button>
																			<button type="button"
																				class="btn btn-primary  btn-small "
																				id="J_editAddrOk">保存</button>
																		</div>
																
																</div>

																<!--点击弹出新增/收货地址界面end-->
																<div class="xm-edit-addr-backdrop"
																	id="J_editAddrBackdrop"></div>
															</div>
														</div>
														<!-- 收货地址 END-->
														<div id="checkoutPayment">
															<!-- 支付方式 -->
															<div class="xm-box">
																<div class="box-hd ">
																	<h2 class="title">支付方式</h2>
																</div>
																<div class="box-bd">
																	<ul id="checkoutPaymentList"
																		class="checkout-option-list clearfix J_optionList">
																		<li class="item selected"><input type="radio"
																			name="Checkout[pay_id]" checked="checked" value="1">
																			<p>
																				在线支付 <span></span>
																			</p></li>
																	</ul>
																</div>
															</div>
															<!-- 支付方式 END-->
															<div class="xm-box">
																<div class="box-hd ">
																	<h2 class="title">配送方式</h2>
																</div>
																<div class="box-bd">
																	<ul id="checkoutShipmentList"
																		class="checkout-option-list clearfix J_optionList">
																		<li class="item selected"><input type="radio"
																			data-price="0" name="Checkout[shipment_id]"
																			checked="checked" value="1">
																			<p>
																				快递配送（免运费） <span></span>
																			</p></li>
																	</ul>
																</div>
															</div>
															<!-- 配送方式 END-->
															<!-- 配送方式 END-->
														</div>
														<!-- 送货时间 -->
														<div class="xm-box">
															<div class="box-hd">
																<h2 class="title">送货时间</h2>
															</div>
															<div class="box-bd">
																<ul class="checkout-option-list clearfix J_optionList">
																	<li class="item selected"><input type="radio"
																		checked="checked" name="Checkout[best_time]" value="1">
																		<p>
																			不限送货时间<span>周一至周日</span>
																		</p></li>
																	<li class="item "><input type="radio"
																		name="Checkout[best_time]" value="2">
																		<p>
																			工作日送货<span>周一至周五</span>
																		</p></li>
																	<li class="item "><input type="radio"
																		name="Checkout[best_time]" value="3">
																		<p>
																			双休日、假日送货<span>周六至周日</span>
																		</p></li>
																</ul>
															</div>
														</div>
														<!-- 送货时间 END-->
														<!-- 发票信息 -->
														<div id="checkoutInvoice">
															<div class="xm-box">
																<div class="box-hd">
																	<h2 class="title">发票信息</h2>
																</div>
																<div class="box-bd">
																	<ul
																		class="checkout-option-list checkout-option-invoice clearfix J_optionList J_optionInvoice">
																		<li class="hide">电子个人发票4</li>
																		<li class="item selected">
																			<!--<label><input type="radio"  class="needInvoice" value="0" name="Checkout[invoice]">不开发票</label>-->
																			<input type="radio" checked="checked" value="4"
																			name="Checkout[invoice]">
																			<p>电子发票（非纸质）</p>
																		</li>
																		<li class="item "><input type="radio" value="1"
																			name="Checkout[invoice]">
																			<p>普通发票（纸质）</p></li>
																	</ul>
																	<p id="eInvoiceTip" class="e-invoice-tip ">
																		电子发票是税务局认可的有效凭证，可作为售后维权凭据，不随商品寄送。开票后不可更换纸质发票，如需报销请选择普通发票。<a
																			href="http://bbs.xiaomi.cn/thread-9285999-1-1.html"
																			target="_blank">什么是电子发票？</a>
																	</p>
																	<div class="invoice-info nvoice-info-1"
																		id="checkoutInvoiceElectronic" style="display: none;">

																		<p class="tip">电子发票目前仅对个人用户开具，不可用于单位报销 ，不随商品寄送</p>
																		<p>发票内容：购买商品明细</p>
																		<p>发票抬头：个人</p>
																		<p>
																			<span class="hide"><input type="radio"
																				value="4" name="Checkout[invoice_type]"
																				checked="checked" id="electronicPersonal"
																				class="invoiceType"></span>
																		<dl>
																			<dt>什么是电子发票?</dt>
																			<dd>&#903;
																				电子发票是纸质发票的映像，是税务局认可的有效凭证，与传统纸质发票具有同等法律效力，可作为售后维权凭据。</dd>
																			<dd>&#903; 开具电子服务于个人，开票后不可更换纸质发票，不可用于单位报销。</dd>
																			<dd>
																				&#903; 您在订单详情的"发票信息"栏可查看、下载您的电子发票。<a
																					href="http://bbs.xiaomi.cn/thread-9285999-1-1.html"
																					target="_blank">什么是电子发票？</a>
																			</dd>
																		</dl>
																		</p>
																	</div>
																	<div class="invoice-info invoice-info-2"
																		id="checkoutInvoiceDetail" style="display: none;">
																		<p>发票内容：购买商品明细</p>
																		<p>发票抬头：请确认单位名称正确,以免因名称错误耽搁您的报销。注：合约机话费仅能开个人发票</p>
																		<ul class="type clearfix J_invoiceType">
																			<li class="hide"><input type="radio" value="0"
																				name="Checkout[invoice_type]" id="noNeedInvoice">
																			</li>
																			<li class=""><input class="invoiceType"
																				type="radio" id="commonPersonal"
																				name="Checkout[invoice_type]" value="1"> 个人
																			</li>
																			<li class=""><input class="invoiceType"
																				type="radio" name="Checkout[invoice_type]" value="2">
																				单位</li>
																		</ul>
																		<div id='CheckoutInvoiceTitle'
																			class=" hide  invoice-title">
																			<label for="Checkout[invoice_title]">单位名称：</label> <input
																				name="Checkout[invoice_title]" type="text"
																				maxlength="49" value="" class="input"> <span
																				class="tip-msg J_tipMsg"></span>
																		</div>

																	</div>

																</div>
															</div>
														</div>
														<!-- 发票信息 END-->
													</div>
													<div class="checkout-box-ft">
														<!-- 商品清单 -->
														<div id="checkoutGoodsList" class="checkout-goods-box">
															<div class="xm-box">
																<div class="box-hd">
																	<h2 class="title">确认订单信息</h2>
																</div>
																<div class="box-bd">
																	<dl class="checkout-goods-list">
																		<dt class="clearfix">
																			<span class="col col-1">商品名称</span> <span
																				class="col col-2">购买价格</span> <span
																				class="col col-3">购买数量</span> <span
																				class="col col-4">小计（元）</span>
																		</dt>
																		
																		
																		<%
			 		                                            if((Map)session.getAttribute("goods")!=null){
			 		                                            int goodKind=0;
			 	                                                  Map<String,Integer>gods = new HashMap<String,Integer>();
			 	                                                 gods = (HashMap)session.getAttribute("goods");
			 	                                                goodKind = gods.size();
			 	                                               String[] goodName = new String[goodKind];
			 	                                                int[] goodNum = new int[goodKind];
			 	                                                  Set<Map.Entry<String,Integer>>set = gods.entrySet();//实现Map遍历
			 	                                                    Iterator<Map.Entry<String,Integer>>iter = set.iterator();
			 	                                                   int n=0;
			 	                                                  while(iter.hasNext()){
			 	                                                       	Map.Entry<String,Integer>me = iter.next();
			 	    	                                        System.out.println(me.getKey()+"="+me.getValue());
			 	    	                                        goodName[n] = me.getKey();
			 	    	                                        goodNum[n] = me.getValue();
			 	    	                                          n++;
			 	                                                      }
			 	    	
			 		                                             for(int i=0;i<goodKind;i++){
			 	                                                        	%>
																		<dd class="item clearfix">
																			<div >
																				<div >		
																				<%out.print(goodName[i]);%>	
																				</div >
																				<div class="col col-2" style="margin-left:840px">195元</div>
																				<div class="col col-3"><%out.print(goodNum[i]);%></div>
																				<div class="col col-4"><span class="total"><%out.print(goodNum[i]*195);%></span></div>
																			</div>
																		</dd>
																		<%}} %>
																		
																	</dl>
																	<div class="checkout-count clearfix">
																		<div class="checkout-count-extend xm-add-buy">
																		
																			<h3 class="title">
																				会员留言
																				</h2>
																				</br> <input type="text" name="board" />
																		</div>
																		<!-- checkout-count-extend -->
																		<div class="checkout-price">
																			<ul>

																				<li>订单总额：<span class="count">0</span>元
																				</li>
																				<li>活动优惠：<span>-0元</span> 
																				</li>
																				<li>优惠券抵扣：<span id="couponDesc">-0元</span>
																				</li>
																				<li>运费：<span id="postageDesc">0元</span>
																				</li>
																			</ul>
																			<p class="checkout-total">
																				应付总额：<span><strong class="count">0</strong>元</span>
																			</p>
																		</div>
																		<!--  -->
																	</div>
																</div>
															</div>

															<!--S 加价购 产品选择弹框 -->
															<div class="modal hide modal-choose-pro"
																id="J_choosePro-664">
																<div class="modal-header">
																	<span class="close" data-dismiss='modal'><i
																		class="iconfont">&#xe617;</i></span>
																	<h3>选择产品</h3>
																	<div class="more">
																		<div class="xm-recommend-page clearfix">
																			<a class="page-btn-prev   J_carouselPrev iconfont"
																				href="javascript: void(0);">&#xe604;</a><a
																				class="page-btn-next  J_carouselNext iconfont"
																				href="javascript: void(0);">&#xe605;</a>
																		</div>
																	</div>
																</div>
																<div class="modal-body J_chooseProCarousel">
																	<div class="J_carouselWrap modal-choose-pro-list-wrap">
																		<ul class="clearfix J_carouselList">
																		</ul>
																	</div>
																</div>
																<div class="modal-footer">
																	<a href="#" class="btn btn-disabled J_chooseProBtn">加入购物车</a>
																</div>
															</div>
															<!--E 加价购 产品选择弹框 -->

															<!--S 保障计划 产品选择弹框 -->


														</div>
														<!-- 商品清单 END -->
														<input type="hidden" id="couponType"
															name="Checkout[couponsType]"> <input
															type="hidden" id="couponValue"
															name="Checkout[couponsValue]">
														<div class="checkout-confirm">

															<a href="#" class="btn btn-lineDakeLight btn-back-cart">返回购物车</a>
															<input type="submit" class="btn btn-primary" value="立即下单"
																id="checkoutToPay" />
														</div>
													</div>

												</form>
											</div>
										</div>
										<script src="js/base.min.js"></script>
										<script type="text/javascript" src="js/address_all.js" charset="utf-8"></script>
										<script type="text/javascript" src="js/checkout.min.js"></script>
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
</body>

</html>