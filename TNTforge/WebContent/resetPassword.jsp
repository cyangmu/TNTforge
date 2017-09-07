<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
    <head>
        <meta charset="utf-8">
        <title>请重新设置密码</title>

        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/reset.css">
        <link rel="stylesheet" href="assets/css/supersized.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>

        <div class="page-container">
            <form action="ResetPasswordServlet" method="post">
                <span  style="color: red">${errors.passwordError}</span>
                <input type="text" name="userName" class="username"  value="${userName}" placeholder="用户名">
                <input type="password" name="newPassword" placeholder="新密码"/>
                <span  style="color: red">${errors.newPassword }</span>
                <input type="password" name="newPassword2" placeholder="确认新密码"/>
                <span  style="color: red">${errors.newPassword2 }</span>
                <input type="submit" value="修改" />
            </form>
            <div class="connect">
                <p>Or connect with:</p>
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
		
        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/supersized.3.2.7.min.js"></script>
        <script src="assets/js/supersized-init.js"></script>
        <script src="assets/js/scripts.js"></script>

    </body></html>