package com.forge.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.forge.getSMS.Config;
import com.forge.getSMS.HttpUtil;
import com.forge.getSMS.IndustrySMS;

/**
 * Servlet implementation class MessProcessServlet
 */
public class MessProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String str = null;
	int code;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessProcessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("code");
		if (str != null) {
			code = Integer.parseInt(str);
		}
		int num = SendServlet.confirmateCode;
		boolean flag;
		if (code == num) {
			flag = true;
		}else {
			flag = false;
		}
		PrintWriter out = response.getWriter();
		out.print(flag);
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
