package com.ocsr.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocsr.service.FetchService;

/**
 * Servlet implementation class FetchController
 */

public class FetchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String des=request.getParameter("des");
		System.out.println(des);
		HttpSession see=request.getSession(true);see.setAttribute("userid", "12");
		if(des.equals("1")){
			System.out.println("des");
			FetchService serviceObj=new FetchService();
			String res=serviceObj.fetchCarMake();
			PrintWriter out=response.getWriter();
			out.println(res);
		}
		else if(des.equals("2")){
			System.out.println("des");
			FetchService serviceObj=new FetchService();
			String make=request.getParameter("make");
			System.out.println(make);
			String res=serviceObj.fetchCarModel(make);
			PrintWriter out=response.getWriter();
			out.println(res);
		}		else if(des.equals("3")){
			System.out.println("des");
			FetchService serviceObj=new FetchService();
			String make=request.getParameter("make");
			String model=request.getParameter("model");
			System.out.println(model);
			String res=serviceObj.fetchCarType(make,model);
			PrintWriter out=response.getWriter();
			out.println(res);
		}
		else if(des.equals("4")){
			HttpSession sess= request.getSession(true);
		String userid=	(String) sess.getAttribute("userid");
			FetchService serviceObj=new FetchService();

			String res=serviceObj.fetchAddress(userid);
			PrintWriter out=response.getWriter();
			out.println(res);
		}
	}

}
