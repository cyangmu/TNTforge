<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.util.*"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Your Goods Detail</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">

    <!-- All css files are included here -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
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
     <script src="js/jquery-2.2.3.min.js"></script>
     <script >
     $(function(){
    	 $("#pdp-addcart").click(function(){
    		alert("商品添加成功！");
    		$.ajax({
    			type:"get",
    			url:"CartServlet",
    			data:{"goodName":$("#goodname").text(),"goodSate":2},
    			success:function(result){			
    				$("#count").html(result);
    			
    				
    			}				
    		})
    	 })
    	 $("#pdp-buynow").click(function(){
    		$.ajax({
    			type:"get",
    			url:"CartServlet",
    			data:{"goodName":$("#goodname").text(),"goodSate":2},
    			success:function(result){			
    				$("#count").html(result);
    			
    				
    			}				
    		})
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
                                    <li id="myaccount"><a href="#"><span class="mr-10">My Account</span><i class="fa fa-angle-down"></i></a>
                                        <ul class="ul-style my-account box-shadow white-bg">
                                            <li><a href="LogOutservlet">Log Out</a></li>
                                            <li><a href="my-account.jsp">My Account</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3 col-xs-6">
                            <div class="header-top-middle">
                                <ul class="header-top-style">
                                    <li id="loged">
                                        <a href="login.jsp">
                                            <span>Login or Register</span>
                                        </a>
                                        <div class="ul-style login-register box-shadow white-bg p-30">
                                            <h6 class="mb-20"><strong>Login</strong></h6>
                                            <input type="text" name="s" class="pl-30" placeholder="user name" id="user-name">
                                            <input type="password" name="d" class="pl-30" placeholder="Password" id="password">
                                            <label class="remmember">
                                                <input type="checkbox">
                                                remember me
                                            </label>
                                            <button value="submit" class="btn-default">Login</button>
                                           <a href="login.jsp"><strong class="mb-20">or register to</strong></a>
                                            <ul class="login-social">
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-4 col-xs-6">
                            <div class="header-top-right">
                                <span class="mr-20"><a href="#"><img alt="" src="images/header/search-icon.png"></a></span>
                                <span><input type="text" class="pl-10" placeholder="Search..."></span>
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
                                <span class="service-img b-img">
                                    <img alt="" src="images/service.png">
                                </span>
                                <span class="service-content ml-15"><strong>+88 (012) 564 979 56</strong><br>We are open 9 am - 10 pm</span>
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
                            <h2 class="breadcrumbs-title text-black m-0">My Account </h2>
                            <ul class="top-page">
                                <li><a href="index.jsp">Home</a></li>
                                <li>></li>
                                <li>My Account</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
        <!-- End Breadcrumbs Area -->
        <!-- Start page content -->
        <versiondata versionjs="201708241842"> <script
		src="./detail/entrance.js.下载" id="zhichiScript" class="zhiCustomBtn"
		data-args="customBtn=true"></script>
	<script type="text/javascript" async="" src="./detail/adv(2)"></script>
	<script type="text/javascript" async="" src="./detail/adv(3)"></script>
	<script async="" src="./detail/rec.aspx"></script>
	<script type="text/javascript" async="" src="./detail/w.js.下载"></script>
	<script type="text/javascript" async="" src="./detail/analytics.js.下载"></script>
	<script type="text/javascript" async="" src="./detail/presadv"></script>
	<script async="" src="./detail/jquery.min.js.下载"></script>
	<script async="" src="./detail/a.js.下载"></script>
	<script type="text/javascript" async="" src="./detail/gs.js.下载"></script>
	<script src="./detail/hm.js.下载"></script>
	<script async="" src="./detail/gtm.js.下载"></script>
	<script async="" src="./detail/jquery1.8.js.下载"></script>
	<script type="text/javascript">
		var _contextPath = "";

		var static_base = "//res.michaelkors.cn";

		var img_base = "//res.michaelkors.cn/resources/";

		var default_Img = "/images/list/product-blank.png";

		var page_base = "//www.michaelkors.cn";

		var destination_base = "//destinationkors.michaelkors.cn";

		var version_image = "201708241842";
		var version_css = "201708241842";
		var version_js = "201708241842";
	</script>
	<link rel="stylesheet" type="text/css" media="screen"
		href="./detail/saved_resource">
	<link rel="stylesheet" type="text/css" media="screen"
		href="./detail/saved_resource(1)">
	<!-- 优驰 sp代码 --> <input type="hidden" name="youchi_user_type"
		id="youchi_user_type" value="0"> <!-- 优驰 sp代码 --> <!-- 公共 JS 部分开始 -->
	<script type="text/javascript" src="./detail/saved_resource(2)"></script>

	<script type="text/javascript">
		(function($) {
			$.spice.init({
				throttleTime : 100,
				debounceTime : 300,
				resize : {
					standard : 1025,
					medium : 768,
					small : 767
				}
			});
		})(jQuery);
	</script> <textarea rows="15" cols="65" style="display: none;"
		id="sensitivePublicKey">
</textarea> <!--XJY Livechat JS CSS引用项-->
	<meta name="google-site-verification"
		content="fm5Rlx3QLsHQcNVsB7DxV36cE5yhjzj6OLFRk7RFb6E">


	<!-- <div id="wrapper"> --> <!-- 顶部公共条 --> <script
		type="text/javascript" src="./detail/header.js.下载"></script> <script
		type="text/javascript" src="./detail/jsencrypt.js.下载"></script>
	<link rel="stylesheet" type="text/css" href="./detail/contact-us.css">
	<script type="text/javascript" src="./detail/contact-us.js.下载"></script>
	<div style="margin: 0 auto; width: 0px; height: 0px; overflow: hidden;">
		<img id="weixin-thumb" src="./detail/wechat-thumb.jpg" width="700">
	</div>
	<!-- 顶部导航部分 --> <script type="text/javascript"
		src="./detail/miniCart.js.下载"></script>
	<div id="wrapper">
		<link rel="stylesheet" type="text/css" href="./detail/pdp-new.css">

		<!-- 模块一 -->
		<article class="article article-product-selection">
			<div class="product-selection-box">
				<style>
.marginLeft-0 {
	margin-left: 0 !important;
}
</style>
				<div
					class="proselect-left events-scroll-wrap events-scroll-wrap-con"
					id="proselect-left">
					<div class="side-scroll" id="side-scroll"
						style="position: absolute; top: 1198.5px;">
						<ul class="side-scroll-list" id="sidebar-nav">
							<li class="side-dot"><a class="thumbnail-link"
								href="javascript:void(0);"> <img
									src="./detail/1502343462132212_2210X2975.jpg" alt="">
							</a></li>
							<li class="side-dot active"><a class="thumbnail-link"
								href="javascript:void(0);"> <img
									src="./detail/15023434664635970_2210X2975.jpg" alt="">
							</a></li>
						</ul>
					</div>
					<div class="col-10-8 scroll-content">
						<div
							class="scroll product-scroll-b events-scroll-loop float-clearfix">
							<div class="product-scroll-b-c">
								<ul class="float-clearfix-xs float-clearfix " id="main">
									<li class="pdp-gallery-list">
										<div class="scroll-background-image img-wrap-list">
											<a> <img src="./detail/1502343462132212_2210X2975.jpg"
												data-image="{
											        &quot;standard&quot;:{&quot;high&quot;:&quot;&quot;, &quot;normal&quot;:&quot;//res.michaelkors.cn/resources/2017/8/10/1502343462132212_2210X2975.jpg&quot;}
											        ,&quot;medium&quot;:{&quot;high&quot;:&quot;&quot;, &quot;normal&quot;:&quot;//res.michaelkors.cn/resources/2017/8/10/1502343462132212_2210X2975.jpg&quot;}
											        ,&quot;small&quot;:{&quot;high&quot;:&quot;&quot;, &quot;normal&quot;:&quot;//res.michaelkors.cn/resources/2017/8/10/1502343462132212_2210X2975.jpg&quot;}
										        }"
												alt="">
												<div class="fullscreen-icon"></div>
											</a>
										</div>
									</li>
									<li class="pdp-gallery-list">
										<div class="scroll-background-image img-wrap-list">
											<a> <img src="./detail/15023434664635970_2210X2975.jpg"
												data-image="{
											        &quot;standard&quot;:{&quot;high&quot;:&quot;&quot;, &quot;normal&quot;:&quot;//res.michaelkors.cn/resources/2017/8/10/15023434664635970_2210X2975.jpg&quot;}
											        ,&quot;medium&quot;:{&quot;high&quot;:&quot;&quot;, &quot;normal&quot;:&quot;//res.michaelkors.cn/resources/2017/8/10/15023434664635970_2210X2975.jpg&quot;}
											        ,&quot;small&quot;:{&quot;high&quot;:&quot;&quot;, &quot;normal&quot;:&quot;//res.michaelkors.cn/resources/2017/8/10/15023434664635970_2210X2975.jpg&quot;}
										        }"
												alt="">
												<div class="fullscreen-icon"></div>
											</a>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div id="pdp-gallery-fullview" class="pdp-gallery-fullview">
						<div class="pdp-gallery-fullview-wrapper">
							<div class="pdp-gallery-fullview-overlay">
								<div class="button-wrapper" data-reactid="1684">
									<button class="pdp-gallery-fullview-close" data-reactid="1685">关闭</button>
								</div>


								<div class="gallery-images">

									<a href="javascript:void(0);">
										<figure>
											<img class="close-model"
												src="./detail/1502343462132212_2210X2975.jpg" alt="">
										</figure>
									</a> <a href="javascript:void(0);">
										<figure>
											<img class="close-model"
												src="./detail/15023434664635970_2210X2975.jpg" alt="">
										</figure>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 获取颜色切换图片 -->
				<!-- 获取销售属性 -->
				<!-- 获取尺寸属性 -->
				<!-- 获取颜色属性 -->
				<div class="proselect-right" id="proselect-right"
					style="position: absolute; top: auto; bottom: 40px;">
					<div class="proselect-right-content">
						<div class="product-description">FORGE</div>
						<div class="product-name-pdp">
							<p id="goodname">TTletria postma</p>
						</div>
						<div class="product-number">
							<p>款号：MF78X6J7R3001</p>
						</div>

						<div class="product-price-pdp">
							<div class="product-price-box">
								<span>¥2,300</span>
							</div>
						</div>
						<div class="product-color">
							<div class="size-top">
								<span class="size-title">颜色：</span> <a
									href="javascript:void(0);" class="size-table"> 黑色</a>
							</div>
							<ul class="product-color-box">
								<li pdpitemcode="MF78X6J7R3001" coloritemproperty="90337"
									pdplifecycle="1" class="is-active"><i
									style="background-image: url(//res.michaelkors.cn/resources/2017/8/10/15023434605858742_100X61.jpg);">黑色</i>
								</li>
							</ul>
						</div>
						<div class="product-select float-clearfix">
							<!--如果没有尺码，把下边这一段注释掉就行-->
							<div class="select-size" style="display: block">
								<div class="size-top">
									<span class="size-title">尺码</span> <span id="size-msg"
										style="color: #DE0000; display: none;">请选择尺码</span>
									<p class="msg-block" style="display: block;">此款商品款型偏大，建议您选购偏小的尺码；</p>
								</div>
								<!-- 模特信息 -->
								<ul class="size-main">
									<li class="" property="[90337,83250]" itempropertyid="83250"
										qty="1" skuid="15338">XXS</li>
									<li class="" property="[90337,83251]" itempropertyid="83251" style="border:solid 1px;"
										qty="1" skuid="15339">XS</li>
									<li class=" no-current pdp-no-qty" property="[90337,83252]"
										itempropertyid="83252" qty="0" skuid="15340">S</li>
									<li class="" property="[90337,83253]" itempropertyid="83253"
										qty="1" skuid="15341">M</li>
									<li class=" no-current pdp-no-qty" property="[90337,83254]"
										itempropertyid="83254" qty="0" skuid="15342">L</li>
								</ul>
							</div>
							<div class="select-size select-num col-12-4 col-sm-12-12">
								<div >
									<span class="size-title">数量</span><input style="border:1px solid lightblue;" type="text" value="1">
								</div>
								
								<div class="dropdown events-dropdown-scroll">
									
									<div class="sub-menu tinyscrollbar evetn-tinyscrollbar-select"
										style="display: none;">
										<div class="viewport">
											<div class="overview">
												<ul>
													<li></li>
												</ul>
											</div>
										</div>
										<div class="scrollbar">
											<div class="track">
												<div class="thumb">
													<div class="end"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<span class="promo-msg-block" id="num-msg" style="display: none;">该商品最多只能购买5件</span>
						</div>


						<div class="product-btn clearfix-float cate-item">
							<div class="add-group event-addtocart" id="pdp-addcart">
								<a class="btn btn-black col-12-12">加入购物车</a>
							</div>
							<div class="choose-group float-right" id="pdp-buynow">
								<a href="shoppingcarts.jsp" class="btn btn-white col-12-12 btn-quy">立刻购买</a>
							</div>
							<span class="promo-msg-block float-clearfix none">很抱歉，您的购物车内该商品数量已达限额</span>
						</div>
						<div class="product-btn clearfix-float msg"
							id="pdp-arrival-notice" style="display: none;">
							<div class="add-group">
								<a class="btn btn-black col-12-12">到货通知</a>
							</div>
							<div class="choose-group float-right"></div>

						</div>
						<!-- 特别说明 -->
						<p class="product-prompt"></p>
						<div class="product-productbox">
							<div class="product-share">
								<ul>
									<li id="pdp-product" class="icon-heart-event heart  "
										itemid="3866"><i class="icon icon-heart"></i> 添加到心愿单</li>
									<li class="nearest "><a
										href="#"><i
											class="icon icon-location"></i><span>查找离您最近的店</span></a></li>
									<li class="weibo"><i class="icon icon-wechat"></i>
										<div class="chat-bubble">
											<div class="scanning-wechat">
												<div class="scanning-wechat-left">
													<img src="./detail/scan_white.jpg" alt="">
													<p>打开微信扫一扫将该商品分享给好友</p>
												</div>
												<div class="scanning-wechat-right">
													<img src="./detail/getqrCode" alt="" width="120px"
														height="120px">
												</div>
											</div>
											<div class="chat-bubble-arrow-border"></div>
											<div class="chat-bubble-arrow"></div>
										</div></li>
									<li class="weixin"><a><i class="icon icon-sina"></i></a></li>
								</ul>
							</div>
							<div class="goods-details goods-products float-clearfix"
								style="display: none;">
								<img class="product-img"
									src="https://www.michaelkors.cn/MF78X6J7R3001/item.htm" alt="">
								<div class="product-info">
									<h2 class="info-title">GIFT WITH PURCHASE</h2>
									<p class="info-text">
										Midnight Shimmer Eau De<br> Parfum,3.4 Oz.<br> See
										Details
									</p>
								</div>
							</div>
							<div class="goods-details goods-details-first float-clearfix"
								style="border-top: 1px solid #D6D6D6; padding-top: 20px;">
								<div class="pro-title">商品风格</div>
								<p style="display: block;">此款高领无袖连衣裙上的荷叶边和铆钉共同营造了温柔华美的效果。雪纺材质，修身显瘦。搭配精致平底鞋完成办公室造型。换上设计感高跟鞋即可出席晚间活动。</p>
							</div>
						</div>

					</div>
				</div>



				<input type="hidden" id="sex1" value=""> <input
					type="hidden" id="sex2" value="女士"> <input type="hidden"
					id="loginEmail" value=""> <input type="hidden"
					id="verifyFavorites" value="false"> <input type="hidden"
					id="itemId" value="3866"> <input type="hidden"
					id="itemCode" value="MF78X6J7R3001"> <input type="hidden"
					id="salePrice" value="2300.00"> <input type="hidden"
					id="listPrice" value="2300.00"> <input type="hidden"
					id="title" value="高领无袖连衣裙"> <input type="hidden"
					id="isAuthCode" value="false"> <input type="hidden"
					id="lifecycle" value="1"> <input type="hidden"
					id="buyLimit" value="5"> <input type="hidden"
					id="reItemCode" value="false">
				<script type="text/javascript" src="./detail/saved_resource(3)"></script>
			</div>
		</article>
		<!-- 风格推荐 -->
		<article class="article style-section style-section1"></article>
		<!-- 你可能喜欢-->
		<!-- <article class="article article-guess-you-like article-like">
		
	</article> -->
		<!-- 宇汇推荐-->
		<article class="article article-guess-you-like pdp-yuhui article-like">
			<div class="guess-you-like">
				<div class="you-like-tit">
					<div class="event-close">
						<span>您可能会喜欢</span>
					</div>
				</div>
				<div class="you-like-con">
					<div class="row product-list-main">
						<div class="list-row">
							<div class="thumbnail">
								<a class="product-img"> <img id="img-out"
									class="cart-referral" itemcode="MF78X741WL001"
									element="MF78X741WL001"
									src="./detail/15023435007649720_442X595.jpg" alt=""
									style="opacity: 1;"> <img itemcode="MF78X741WL001"
									element="MF78X741WL001" class="cart-referral hover-img"
									src="./detail/15023434942645030_442X595.jpg" alt=""
									style="opacity: 1;">
									<div class="quickview-container e-list-quick none-sm"
										itemcode="MF78X741WL001"
										clickurl="https://bw.kuaizitech.com/RecWeb/RecClick.aspx?ch=402&amp;m=9&amp;la=item&amp;pos=1&amp;it=MF78X741WL001&amp;icid=MF78X6J7R3001&amp;imk=1503623902002_9262i0&amp;ck=CBR20170824214322796718&amp;bwp_stk=01c3bacd453389e71180be305a3a76fce8&amp;vpt=2&amp;u=https%3a%2f%2fwww.michaelkors.cn%2fMF78X741WL001%2fitem.htm"
										element="MF78X741WL001">
										<span class="quickview-btn">快速预览</span>
									</div>
								</a>
								<div class="product-name">
									<h2 class="tit">FORGE</h2>
									<p class="name">无袖圆领铆钉装饰连衣裙</p>
								</div>
								<div class="product-price">
									<p>￥2,150</p>
								</div>
								<div class="more-color" style="display: none;">
									<a href="javascript:void(0);" class="event-color"><i
										class="add-icon"></i>更多颜色</a>
								</div>
							</div>
						</div>

						<div class="list-row">
							<div class="thumbnail">
								<a class="product-img"> <img id="img-out"
									class="cart-referral" itemcode="MF78X6A79M001"
									element="MF78X6A79M001"
									src="./detail/15023434439111208_442X595.jpg" alt=""
									style="opacity: 1;"> <img itemcode="MF78X6A79M001"
									element="MF78X6A79M001" class="cart-referral hover-img"
									src="./detail/15023434478742228_442X595.jpg" alt=""
									style="opacity: 1;">
									<div class="quickview-container e-list-quick none-sm"
										itemcode="MF78X6A79M001"
										clickurl="https://bw.kuaizitech.com/RecWeb/RecClick.aspx?ch=402&amp;m=9&amp;la=item&amp;pos=2&amp;it=MF78X6A79M001&amp;icid=MF78X6J7R3001&amp;imk=1503623902002_9262i0&amp;ck=CBR20170824214322796718&amp;bwp_stk=01c3bacd453389e71180be305a3a76fce8&amp;vpt=2&amp;u=https%3a%2f%2fwww.michaelkors.cn%2fMF78X6A79M001%2fitem.htm"
										element="MF78X6A79M001">
										<span class="quickview-btn">快速预览</span>
									</div>
								</a>
								<div class="product-name">
									<h2 class="tit">FORGE</h2>
									<p class="name">短袖圆领蕾丝提花连衣裙</p>
								</div>
								<div class="product-price">
									<p>￥3,150</p>
								</div>
								<div class="more-color" style="display: none;">
									<a href="javascript:void(0);" class="event-color"><i
										class="add-icon"></i>更多颜色</a>
								</div>
							</div>
						</div>

						<div class="list-row">
							<div class="thumbnail">
								<a class="product-img"> <img id="img-out"
									class="cart-referral" itemcode="MU78X1Y64S001"
									element="MU78X1Y64S001"
									src="./detail/14974315200702403_442X595.jpg" alt=""
									style="opacity: 1;"> <img itemcode="MU78X1Y64S001"
									element="MU78X1Y64S001" class="cart-referral hover-img"
									src="./detail/14974315218647892_442X595.jpg" alt=""
									style="opacity: 1;">
									<div class="quickview-container e-list-quick none-sm"
										itemcode="MU78X1Y64S001"
										clickurl="https://bw.kuaizitech.com/RecWeb/RecClick.aspx?ch=402&amp;m=9&amp;la=item&amp;pos=3&amp;it=MU78X1Y64S001&amp;icid=MF78X6J7R3001&amp;imk=1503623902002_9262i0&amp;ck=CBR20170824214322796718&amp;bwp_stk=01c3bacd453389e71180be305a3a76fce8&amp;vpt=2&amp;u=https%3a%2f%2fwww.michaelkors.cn%2fMU78X1Y64S001%2fitem.htm"
										element="MU78X1Y64S001">
										<span class="quickview-btn">快速预览</span>
									</div>
								</a>
								<div class="product-name">
									<h2 class="tit">FORGE</h2>
									<p class="name">短袖小立领收腰连衣裙</p>
								</div>
								<div class="product-price">
									<p>￥2,625</p>
								</div>
								<div class="more-color" style="display: none;">
									<a href="javascript:void(0);" class="event-color"><i
										class="add-icon"></i>更多颜色</a>
								</div>
							</div>
						</div>

						<div class="list-row">
							<div class="thumbnail">
								<a class="product-img"> <img id="img-out"
									class="cart-referral" itemcode="MF78XA84ZB001"
									element="MF78XA84ZB001"
									src="./detail/15023434564885972_442X595.jpg" alt=""
									style="opacity: 1;"> <img itemcode="MF78XA84ZB001"
									element="MF78XA84ZB001" class="cart-referral hover-img"
									src="./detail/15023434523607846_442X595.jpg" alt=""
									style="opacity: 1;">
									<div class="quickview-container e-list-quick none-sm"
										itemcode="MF78XA84ZB001"
										clickurl="https://bw.kuaizitech.com/RecWeb/RecClick.aspx?ch=402&amp;m=9&amp;la=item&amp;pos=4&amp;it=MF78XA84ZB001&amp;icid=MF78X6J7R3001&amp;imk=1503623902002_9262i0&amp;ck=CBR20170824214322796718&amp;bwp_stk=01c3bacd453389e71180be305a3a76fce8&amp;vpt=2&amp;u=https%3a%2f%2fwww.michaelkors.cn%2fMF78XA84ZB001%2fitem.htm"
										element="MF78XA84ZB001">
										<span class="quickview-btn">快速预览</span>
									</div>
								</a>
								<div class="product-name">
									<h2 class="tit">FORGE</h2>
									<p class="name">单肩袖层次设计收腰连衣裙</p>
								</div>
								<div class="product-price">
									<p>￥3,300</p>
								</div>
								<div class="more-color" style="display: none;">
									<a href="javascript:void(0);" class="event-color"><i
										class="add-icon"></i>更多颜色</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</article>
		<!-- 最近浏览 -->
		<article class="article article-guess-you-like pdp-history">
			<!-- 最近浏览 -->
		</article>



		</section>

		<script type="text/javascript" src="./detail/detail-new.js.下载"></script>
		<script type="text/javascript" src="./detail/pdp-new.js.下载"></script>
		<script type="text/javascript" src="./detail/sub-pdp.js.下载"></script>
		<script type="text/javascript" src="./detail/yuhui.js.下载"></script>
		<script async="" src="./detail/rec.js.下载"></script>

		<div class="guess-you-like" id="products" style="display: none;">
			<div class="you-like-tit">
				<div class="event-close">
					<span>您可能会喜欢</span>
				</div>
			</div>
			<div class="you-like-con">
				<div class="row product-list-main">
					<div class="list-row">
						<div class="thumbnail">
							<a class="product-img"> <img id="img-out"
								class="cart-referral" itemcode="MF78X741WL001"
								element="MF78X741WL001"
								src="./detail/15023435007649720_442X595.jpg" alt=""
								style="opacity: 1;"> <img itemcode="MF78X741WL001"
								element="MF78X741WL001" class="cart-referral hover-img"
								src="./detail/15023434942645030_442X595.jpg" alt=""
								style="opacity: 1;">
								<div class="quickview-container e-list-quick none-sm"
									itemcode="MF78X741WL001"
									clickurl="https://bw.kuaizitech.com/RecWeb/RecClick.aspx?ch=402&amp;m=9&amp;la=item&amp;pos=1&amp;it=MF78X741WL001&amp;icid=MF78X6J7R3001&amp;imk=1503623902002_9262i0&amp;ck=CBR20170824214322796718&amp;bwp_stk=01c3bacd453389e71180be305a3a76fce8&amp;vpt=2&amp;u=https%3a%2f%2fwww.michaelkors.cn%2fMF78X741WL001%2fitem.htm"
									element="MF78X741WL001">
									<span class="quickview-btn">快速预览</span>
								</div>
							</a>
							<div class="product-name">
								<h2 class="tit">FORGE</h2>
								<p class="name">无袖圆领铆钉装饰连衣裙</p>
							</div>
							<div class="product-price">
								<p>2150</p>
							</div>
							<div class="more-color" style="display: none;">
								<a href="javascript:void(0);" class="event-color"><i
									class="add-icon"></i>更多颜色</a>
							</div>
						</div>
					</div>

					<div class="list-row">
						<div class="thumbnail">
							<a class="product-img"> <img id="img-out"
								class="cart-referral" itemcode="MF78X6A79M001"
								element="MF78X6A79M001"
								src="./detail/15023434439111208_442X595.jpg" alt=""
								style="opacity: 1;"> <img itemcode="MF78X6A79M001"
								element="MF78X6A79M001" class="cart-referral hover-img"
								src="./detail/15023434478742228_442X595.jpg" alt=""
								style="opacity: 1;">
								<div class="quickview-container e-list-quick none-sm"
									itemcode="MF78X6A79M001"
									clickurl="https://bw.kuaizitech.com/RecWeb/RecClick.aspx?ch=402&amp;m=9&amp;la=item&amp;pos=2&amp;it=MF78X6A79M001&amp;icid=MF78X6J7R3001&amp;imk=1503623902002_9262i0&amp;ck=CBR20170824214322796718&amp;bwp_stk=01c3bacd453389e71180be305a3a76fce8&amp;vpt=2&amp;u=https%3a%2f%2fwww.michaelkors.cn%2fMF78X6A79M001%2fitem.htm"
									element="MF78X6A79M001">
									<span class="quickview-btn">快速预览</span>
								</div>
							</a>
							<div class="product-name">
								<h2 class="tit">FORGE</h2>
								<p class="name">短袖圆领蕾丝提花连衣裙</p>
							</div>
							<div class="product-price">
								<p>3150</p>
							</div>
							<div class="more-color" style="display: none;">
								<a href="javascript:void(0);" class="event-color"><i
									class="add-icon"></i>更多颜色</a>
							</div>
						</div>
					</div>

					<div class="list-row">
						<div class="thumbnail">
							<a class="product-img"> <img id="img-out"
								class="cart-referral" itemcode="MU78X1Y64S001"
								element="MU78X1Y64S001"
								src="./detail/14974315200702403_442X595.jpg" alt=""
								style="opacity: 1;"> <img itemcode="MU78X1Y64S001"
								element="MU78X1Y64S001" class="cart-referral hover-img"
								src="./detail/14974315218647892_442X595.jpg" alt=""
								style="opacity: 1;">
								<div class="quickview-container e-list-quick none-sm"
									itemcode="MU78X1Y64S001"
									clickurl="https://bw.kuaizitech.com/RecWeb/RecClick.aspx?ch=402&amp;m=9&amp;la=item&amp;pos=3&amp;it=MU78X1Y64S001&amp;icid=MF78X6J7R3001&amp;imk=1503623902002_9262i0&amp;ck=CBR20170824214322796718&amp;bwp_stk=01c3bacd453389e71180be305a3a76fce8&amp;vpt=2&amp;u=https%3a%2f%2fwww.michaelkors.cn%2fMU78X1Y64S001%2fitem.htm"
									element="MU78X1Y64S001">
									<span class="quickview-btn">快速预览</span>
								</div>
							</a>
							<div class="product-name">
								<h2 class="tit">FORGE</h2>
								<p class="name">短袖小立领收腰连衣裙</p>
							</div>
							<div class="product-price">
								<p>2625</p>
							</div>
							<div class="more-color" style="display: none;">
								<a href="javascript:void(0);" class="event-color"><i
									class="add-icon"></i>更多颜色</a>
							</div>
						</div>
					</div>

					<div class="list-row">
						<div class="thumbnail">
							<a class="product-img"> <img id="img-out"
								class="cart-referral" itemcode="MF78XA84ZB001"
								element="MF78XA84ZB001"
								src="./detail/15023434564885972_442X595.jpg" alt=""
								style="opacity: 1;"> <img itemcode="MF78XA84ZB001"
								element="MF78XA84ZB001" class="cart-referral hover-img"
								src="./detail/15023434523607846_442X595.jpg" alt=""
								style="opacity: 1;">
								<div class="quickview-container e-list-quick none-sm"
									itemcode="MF78XA84ZB001"
									clickurl="https://bw.kuaizitech.com/RecWeb/RecClick.aspx?ch=402&amp;m=9&amp;la=item&amp;pos=4&amp;it=MF78XA84ZB001&amp;icid=MF78X6J7R3001&amp;imk=1503623902002_9262i0&amp;ck=CBR20170824214322796718&amp;bwp_stk=01c3bacd453389e71180be305a3a76fce8&amp;vpt=2&amp;u=https%3a%2f%2fwww.michaelkors.cn%2fMF78XA84ZB001%2fitem.htm"
									element="MF78XA84ZB001">
									<span class="quickview-btn">快速预览</span>
								</div>
							</a>
							<div class="product-name">
								<h2 class="tit">FORGE</h2>
								<p class="name">单肩袖层次设计收腰连衣裙</p>
							</div>
							<div class="product-price">
								<p>3300</p>
							</div>
							<div class="more-color" style="display: none;">
								<a href="javascript:void(0);" class="event-color"><i
									class="add-icon"></i>更多颜色</a>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
        <!-- Start footer area -->
        <footer id="footer" class="footer-area">
            <div class="footer-top-area text-center ptb-40">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="footer-top-content">
                                <a href="index.jsp">
                                    <img src="images/footer/logo.png" alt="">
                                </a>
                                <p class="pb-30">Forge is the best ecommerce site lorem ipsum dolor sit amet, consectetur aiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
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
                                    <li class="contact-icon">
                                        <img alt="" src="images/footer/icon/1.png">
                                    </li>
                                    <li class="footer-text text-ash">
                                        <p>8901 Marmora Raod,</p>
                                        <p>Glasgow, D04  89GR</p>
                                    </li>
                                </ul>
                                <ul class="footer-contact">
                                    <li class="contact-icon">
                                        <img alt="" src="images/footer/icon/2.png">
                                    </li>
                                    <li class="footer-text text-ash">
                                        <p>Telephone : (801) 4256  9856</p>
                                        <p>Telephone : (801) 4256  9658</p>
                                    </li>
                                </ul>
                                <ul class="footer-contact">
                                    <li class="contact-icon">
                                        <img alt="" src="images/footer/icon/3.png">
                                    </li>
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
                                            <a href="#">
                                                <img alt="" src="images/footer/tweet/1.jpg">
                                            </a>
                                        </div>
                                        <div class="tweet-text">
                                            <a href="#">Forge is the best ecommerce elt</a>
                                            <p>Jan 25, 2017</p>
                                        </div>
                                    </li>
                                    <li class="tweet-inner clearfix">
                                        <div class="tweet-img">
                                            <a href="#">
                                                <img alt="" src="images/footer/tweet/2.jpg">
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
                                            <a href="#">
                                                <img alt="" src="images/footer/tweet/1.jpg">
                                            </a>
                                        </div>
                                        <div class="tweet-text">
                                            <a href="#">Forge is the best ecommerce elt</a>
                                            <p>Jan 25, 2017</p>
                                        </div>
                                    </li>
                                    <li class="tweet-inner clearfix">
                                        <div class="tweet-img">
                                            <a href="#">
                                                <img alt="" src="images/footer/tweet/2.jpg">
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
