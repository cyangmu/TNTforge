package com.forge.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CodetwoServlet
 */
public class CodetwoServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		response.setCharacterEncoding("UTF-8");
		if (request.getSession().getAttribute("code").equals(code)) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
		response.flushBuffer();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
}
