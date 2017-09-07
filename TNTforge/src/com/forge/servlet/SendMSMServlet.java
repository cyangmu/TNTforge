package com.forge.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.PhoneDao;
import com.forge.getSMS.Config;
import com.forge.getSMS.HttpUtil;

/**
 * Servlet implementation class SendMSMServlet
 */
public class SendMSMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMSMServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = (String) request.getSession().getAttribute("logeduser");
		PhoneDao phoneDao = new PhoneDao();
		String phonenum = phoneDao.selPhone(uname);
		String ret = execute(phonenum);
		boolean flag;
		if (ret.indexOf("请求成功") != -1) {
			flag = true;
		} else {
			flag = false;
		}
		PrintWriter out = response.getWriter();
		out.print(flag);
		out.flush();
		out.close();
	}
	
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String smsContent = "【Forge科技】亲！您在本店购买的商品已经付款成功，我们会尽快打包发货，感谢您的光临！";

	/**
	 * 验证码通知短信
	 */
	public static String execute(String phone)
	{
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + phone + "&smsContent=" + smsContent
				+ HttpUtil.createCommonParam();

		// 提交请求
		String result = HttpUtil.post(url, body);
		System.out.println("result:" + result);
		return result;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
