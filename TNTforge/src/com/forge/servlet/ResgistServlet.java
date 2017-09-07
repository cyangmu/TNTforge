package com.forge.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.UserDao;
import com.forge.entity.User;
import com.forge.util.MD5encrypt;

/**
 * Servlet implementation class ResgistServlet
 */
public class ResgistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ResgistServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String ugender = request.getParameter("ugender");
		String ubirthday = (String) request.getParameter("ubirth");
		String uemail = request.getParameter("uemail");
		String utel = request.getParameter("utel");
		String upsw = request.getParameter("upsw");
		String MDupsw = MD5encrypt.MD5(upsw);
		User user = new User(uname, MDupsw, ubirthday, ugender, utel, uemail);
		int res = new UserDao().addUser(user);
		request.getSession().setAttribute("logeduser", uname);
		if (res != 0) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
