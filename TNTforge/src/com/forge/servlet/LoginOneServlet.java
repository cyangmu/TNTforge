package com.forge.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.UserDao;
import com.forge.entity.User;
import com.forge.util.MD5encrypt;

/**
 * Servlet implementation class LoginOneServlet
 */
public class LoginOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginOneServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1、获得表单提交的数据
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String MDpassword = MD5encrypt.MD5(password);
		String rempass = request.getParameter("rempass");
		// 2、封装对象
		User user = new User();
		user.setUname(name);
		user.setUpassword(MDpassword);
		// 3、调用Dao执行数据库操作
		UserDao userDao = new UserDao();
		boolean ret = userDao.checkUser(user);
		// 4、根据数据库操作返回的结果，封装数据&页面跳转
		if (rempass != null) {
			if (ret && rempass.equals("on")) {
				Cookie c1 = new Cookie("cname", name);
				Cookie c2 = new Cookie("cpass", password);
				c1.setMaxAge(5 * 60);
				c2.setMaxAge(5 * 60);
				response.addCookie(c1);
				response.addCookie(c2);
				System.out.println("存储cookie");
				request.getSession().setAttribute("logeduser", name);
				response.sendRedirect("index.jsp");
			}
		} else if (ret) {
			request.getSession().setAttribute("logeduser", name);
			response.sendRedirect("index.jsp");
		} else {
			request.getSession().setAttribute("error", "用户登录失败！");
			response.sendRedirect("login.jsp");
		}
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
