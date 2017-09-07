package com.forge.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.UserDao;
import com.forge.entity.User;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class UserListServlet
 */
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> proList = new ArrayList<User>();
		List<User> proList1 = new ArrayList<User>();
		List<User> proList2 = new ArrayList<User>();
		List<User> proList3 = new ArrayList<User>();
		UserDao userDao = new UserDao();
		proList = userDao.selUser();
		Map<String, List> map = new HashMap<String, List>();

		String name = request.getParameter("searchText");
		int alltotal = proList.size();
		int num = (alltotal / 10) + 1;

		if (alltotal > 10) {
			for (int i = 0; i < 10; i++) {
				proList1.add(proList.get(i));
			}
			if (alltotal > 10 && alltotal < 20) {
				for (int i = 10; i < alltotal; i++) {
					proList2.add(proList.get(i));
				}
			}
			if (alltotal > 20 && alltotal < 30) {
				for (int i = 10; i < alltotal; i++) {
					proList3.add(proList.get(i));
				}
			}
		} else {
			for (int i = 0; i < alltotal; i++) {
				proList1.add(proList.get(i));
			}
		}
		map.put("1", proList1);
		map.put("2", proList2);
		map.put("3", proList3);
		String opt = request.getParameter("opt");
		String page = request.getParameter("page");
		String rows = request.getParameter("rows");
		String retStr = null;
		switch (opt) {
		case "list":
			Map<String, Object> jsonMap = new HashMap<String, Object>();// 定义map
			jsonMap.put("total", alltotal);// total键 存放总记录数，必须的
			jsonMap.put("rows", map.get(page));// rows键 存放每页记录 list
			retStr = JSONObject.fromObject(jsonMap).toString();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(retStr);
			break;
//		case "del":
//			boolean del = productDao.delProduct(pid);
//			response.setContentType("text/html;charset=utf-8");
//			response.getWriter().print(del);
//			break;
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
