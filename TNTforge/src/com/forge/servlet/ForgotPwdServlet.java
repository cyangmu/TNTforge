package com.forge.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.UserDao;
import com.forge.entity.User;
import com.forge.util.EmailUtils;

/**
 * Servlet implementation class ForgotPwdServlet
 */
public class ForgotPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPwdServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userNameOrEmail = request.getParameter("userNameOrEmail");
		UserDao userDao = new UserDao();
		User user = userDao.findUserByNameOrEmail(userNameOrEmail);
		if (user == null) {
			request.setAttribute("errorMsg", "User Not Exist！");
			request.getRequestDispatcher("/forgotPwd.jsp").forward(request, response);
			return;
		}

		// 发送重新设置密码的链接
		EmailUtils.sendResetPasswordEmail(user);

		request.setAttribute("sendMailMsg", "您的申请已提交成功，请查看您的" + user.getUemail() + "邮箱。");

		request.getRequestDispatcher("/forgotPwd.jsp").forward(request, response);
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
