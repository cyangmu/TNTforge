<%@ page language="Java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
        <title>请通过手机验证</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
     <meta charset="utf-8">
        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/jquery-1.11.1.min.js"></script>  
	<script type="text/javascript">
		$(function(){
			$("#getCode").removeAttr("disabled");
			//发送验证码
			$("#getCode").click(function(){	
				$.ajax({
					url:"SendServlet",
					data:{
						"phone":$("#phone").val()
					},
					type:"post",
					async:false,
					dataType:"text",
					success : function(data) {
						if(data=='true'){
							alert("验证码发送成功，收到后请输入验证码");
							time(this);
						} else {
							alert("验证码发送失败");
						}
					},
					error : function() {
						alert("error");
					}
				});
			});
			//验证
			$("#validate").click(function(){	
				$.ajax({
					url:"MessProcessServlet",
					data:{
						"code":$("#code").val()
					},
					type:"post",
					async:false,
					dataType:"text",
					success : function(data) {
						if(data=='true'){
							alert("恭喜您，验证成功");
							 window.location.href="resetPassword.jsp";
						} else {
							alert("验证失败");
						}
					},
					error : function() {
						alert("error");
					}
				});
			});
		})
		
		//验证码倒计时
		var wait = 60;
		function time(obj) {
			if(wait==0) {
				$("#getCode").removeAttr("disabled");
				$("#getCode").val("获取验证码");
				wait = 60;
			}else {
				$("#getCode").attr("disabled","true");
				$("#getCode").val(wait+"秒后重试");
				wait--;
				setTimeout(function() {		//倒计时方法
					time(obj);
				},1000);	//间隔为1s
			}
		}
	</script>
   </head>
  <body>
  
  <div class="page-container">
  	<input type="text" id="phone" placeholder="请输入手机号码">
  	<input id="getCode" type="button" value="获取验证码"><br>
  	<input type="text" id="code" placeholder="6位验证码">
  	<input id="validate" type="button" value="验证"><br/>
  	<a href="index.jsp" ><input type=button value="Home" /></a>
  	</div>
  	<script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>
   </body>
</html>