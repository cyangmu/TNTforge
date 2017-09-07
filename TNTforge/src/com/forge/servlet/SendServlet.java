package com.forge.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.getSMS.Config;
import com.forge.getSMS.HttpUtil;

/**
 * Servlet implementation class SendServlet
 */
public class SendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String phone = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SendServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		phone = request.getParameter("phone");
		PrintWriter out = response.getWriter();
		String ret = execute(phone);
		boolean flag;
		if (ret.indexOf("请求成功") != -1) {
			flag = true;
		} else {
			flag = false;
		}
		out.print(flag);
		out.flush();
		out.close();
	}

	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	public static int confirmateCode = getConfirmationCode();
	private static String smsContent = "【Forge科技】您的验证码为" + confirmateCode + "，请于30分钟内正确输入，如非本人操作，请忽略此短信。";
	public static int getConfirmationCode() {
		int confirmationCode = (int) (Math.random() * 1000000);
		return confirmationCode;
	}

	/**
	 * 验证码通知短信
	 */
	public static String execute(String myphone) {
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + myphone + "&smsContent=" + smsContent
				+ HttpUtil.createCommonParam();
		// 提交请求
		String result = HttpUtil.post(url, body);
		System.out.println(result);
		return result;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
