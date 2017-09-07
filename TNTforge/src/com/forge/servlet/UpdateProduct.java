package com.forge.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.ProductDao;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDao productDao = new ProductDao();
		double pprice = 0;
		int pcount = 0;
		int pid = 0;
		String sid = request.getParameter("pid");
		if (sid != null) {
			pid = Integer.parseInt(sid);
		}
		String pname = request.getParameter("productname");
		String sprice = request.getParameter("productprice");
		if (sprice != null) {
			pprice = Double.parseDouble(sprice);
		}
		String scount = request.getParameter("productcount");
		if (scount != null) {
			pcount = Integer.parseInt(scount);
		}
		String pimg = request.getParameter("productimg");
		String pdescribe = request.getParameter("productdescribe");

		boolean update = productDao.upProduct(pid, pname, pprice, pcount, pimg, pdescribe);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(update);
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
