package com.forge.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartServlet
 */
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("goodName");
		PrintWriter p = response.getWriter();
		HttpSession session = request.getSession();
		Map<String, Integer> goods = new HashMap<String, Integer>();

		if ((Map) session.getAttribute("goods") != null) {
			goods = (HashMap) session.getAttribute("goods");
		}

		if (goods.get(name) == null) {
			goods.put(name, 1);
			session.setAttribute("goods", goods);
		} else {
			Integer num = null;
			num = goods.get(name);
			goods.put(name, num + 1);
			session.setAttribute("goods", goods);
		}

		p.print(((HashMap) session.getAttribute("goods")).size());
		p.flush();
		p.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
