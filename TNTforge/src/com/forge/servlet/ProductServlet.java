package com.forge.servlet;

import net.sf.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.dao.ProductDao;
import com.forge.entity.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Product> proList = new ArrayList<Product>();
		List<Product> proList1 = new ArrayList<Product>();
		List<Product> proList2 = new ArrayList<Product>();
		List<Product> proList3 = new ArrayList<Product>();
		ProductDao productDao = new ProductDao();
		proList = productDao.selProduct();
		Map<String, List> map = new HashMap<String, List>();
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
		// map.put("1", proList1);
		// proList1.add(new Products(11,"手机", 3000,25,"images/1.jpg","ok"));
		// proList1.add(new Products(12,"手机", 3000,25,"images/1.jpg","ok"));
		// map.put("2", proList1);

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
		case "add":
			Product product = new Product();
			product.setPname(pname);
			product.setPprice(pprice);
			product.setPcount(pcount);
			product.setPimg(pimg);
			product.setPdescript(pdescribe);
			boolean add = productDao.addProduct(product);
			// proList.add(new Products(pid, pname,
			// pprice,pcount,pimg,pdescribe));
			// jsonMap = new HashMap<String, Object>();//定义map
			// jsonMap.put("total", 13);//total键 存放总记录数，必须的
			// jsonMap.put("rows", proList1);//rows键 存放每页记录 list
			// retStr = JSONObject.fromObject(jsonMap).toString();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(add);
			break;
		case "del":
			boolean del = productDao.delProduct(pid);
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(del);
			break;
		default:
			break;
		}
		// response.setContentType("text/html;charset=utf-8");
		// response.getWriter().print(retStr);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
