package com.ocsr.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocsr.bean.LoginBean;
import com.ocsr.service.LoginService;
import com.ocsr.utils.Encryptor;

/**
 * Servlet implementation class LoginController
 */
@WebServlet( "/LoginController" )
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public LoginController() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		LoginBean bean = new LoginBean();
		bean.setUsername(request.getParameter("uname"));
	//	bean.setPassword(request.getParameter("pass"));
		String encrypt=Encryptor.encryptData(request.getParameter("pass"));
		System.out.println(encrypt);
		bean.setPassword(encrypt);
		LoginService loginService = new LoginService();
		String role = loginService.validateCredentials(bean);
		System.out.println(role);
		PrintWriter out = response.getWriter();
		if(role!=""){
			HttpSession session=request.getSession(true);
			String[] temp=role.split("/");
			session.setAttribute("user",temp[0]);
			System.out.println(session.getAttribute("user"));
			session.setAttribute("username",temp[1]);
			session.setAttribute("userid",temp[2]);
			out.println(1);
		}
		else{
			out.println(2);
		}

	}

}
