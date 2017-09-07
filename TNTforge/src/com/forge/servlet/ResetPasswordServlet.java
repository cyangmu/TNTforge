package com.forge.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.UserDao;
import com.forge.entity.User;

/**
 * Servlet implementation class ResetPasswordServlet
 */
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResetPasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String newPassword = request.getParameter("newPassword");
		String newPassword2 = request.getParameter("newPassword2");
		Map<String, String> errors = new HashMap<String, String>();
		if (newPassword == null || "".equals(newPassword)) {
			errors.put("newPassword", "新密码不能为空！");
		}

		if (newPassword2 == null || "".equals(newPassword2)) {
			errors.put("newPassword2", "确认新密码不能为空！");
		}

		if (!newPassword.equals(newPassword2)) {
			errors.put("passwordError", "两次输入的密码不一致！");
		}

		if (!errors.isEmpty()) {
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("/resetPassword.jsp?userName=" + userName).forward(request, response);
			return;
		}

		UserDao userDao = new UserDao();
		User user = userDao.findUserByName(newPassword, userName);

		request.getRequestDispatcher("/resetPasswordSuccess.jsp").forward(request, response);

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
