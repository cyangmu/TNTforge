package com.forge.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckSessionFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public CheckSessionFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("经过用户验证过滤器");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String uri = req.getRequestURI();
		String[] exceptPages = { "my-account.jsp","orderDetail.jsp","orderSubmit.jsp","shoppingcarts.jsp"};
		if (!checkJspServlet(exceptPages, uri)){
			if (req.getSession().getAttribute("logeduser") == null) {
				res.sendRedirect("index.jsp");
			}
		}
		chain.doFilter(req, response);

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

	public boolean checkJspServlet(String[] s, String uri) {
		for (int i = 0; i < s.length; i++) {
			if(uri.contains(s[i])){
				return false;
			}
		}
		return true;
	}

}
