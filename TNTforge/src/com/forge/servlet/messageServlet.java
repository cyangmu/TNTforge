package com.forge.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

/**
 * Servlet implementation class messageServlet
 */
public class messageServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone = request.getParameter("phone");
		response.setCharacterEncoding("UTF-8");
		// 获取验证码
		String code = getCode(request);
		// 发送短信
		sendMsg(phone, code);
		response.getWriter().write("true");
		response.flushBuffer();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	// 发送短信
	private void sendMsg(String phone, String code) throws HttpException, IOException {
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://utf8.sms.webchinese.cn/");
		post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf8");// 在头文件中设置转码
		NameValuePair[] data = { new NameValuePair("Uid", "TNT团队"), // 注册的用户名
				new NameValuePair("Key", "1e2adec728c431e424a3"), // 注册成功后，登录网站后得到的密钥
				new NameValuePair("smsMob", phone), // 手机号码
				new NameValuePair("smsText", "千万别告诉别人哦~。~" + code) };// 短信内容
		post.setRequestBody(data);

		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:" + statusCode);
		for (Header h : headers) {
			System.out.println("-----" + h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes("utf8"));
		System.out.println(result); // 打印返回消息状态
		post.releaseConnection();
	}

	// 获取验证码
	private String getCode(HttpServletRequest request) {
		Random rand = new Random();
		String code = "";
		for (int i = 0; i < 4; i++) {
			code += rand.nextInt(10);
		}
		request.getSession().setAttribute("code", code);
		return code;
	}

}
