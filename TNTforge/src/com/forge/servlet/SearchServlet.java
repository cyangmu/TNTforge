package com.forge.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.UserDao;
import com.forge.entity.Products;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
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

		String search = request.getParameter("search");
		System.out.println(search);
		if (search != "") {
			PrintWriter p = response.getWriter();
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			String url = "jdbc:mysql://192.168.210.42:3306/forge?characterEncoding=utf8";
			String user = "users";
			String password = "123";
			List<String> nameList = new ArrayList<String>();
			try {

				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
				System.out.println(conn);
				stmt = conn.createStatement();
				String sql = "select pname from products where pname like '" + search + "%'";
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					nameList.add(rs.getString("pname"));
				}
				StringBuffer sbu = new StringBuffer();
				for (int i = 0; i < nameList.size(); i++) {
					sbu.append((String) nameList.get(i) + ",");
				}
				p.print(sbu.toString());
				p.flush();
				p.close();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				p.close();
			}
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
