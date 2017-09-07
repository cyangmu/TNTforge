package com.forge.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.UserDao;
import com.forge.entity.UserAddress;

/**
 * Servlet implementation class AddressServlet
 */
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddressServlet() {
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
		request.setCharacterEncoding("utf-8");
		String province = request.getParameter("province");
		System.out.println(province);
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String receiver = request.getParameter("receiver");
		String receivertel = request.getParameter("receivertel");
		String extra = request.getParameter("extra");
		String tag = request.getParameter("tag");
		UserAddress userAddress = new UserAddress(province, city, county, extra, receiver, receivertel, tag);
		UserDao userDao = new UserDao();
		int i = userDao.addAddress(userAddress);
		PrintWriter p = response.getWriter();
		StringBuffer sbu = new StringBuffer();
		sbu.append(userAddress.getReceiver() + "," + userAddress.getReceivertel() + "," + userAddress.getExtra() + ","
				+ userAddress.getTag() + "," + userAddress.getProvince() + "," + userAddress.getCity() + ","
				+ userAddress.getCounty());
		if (i != 0) {
			p.print(sbu.toString());
			p.flush();
			p.close();
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
