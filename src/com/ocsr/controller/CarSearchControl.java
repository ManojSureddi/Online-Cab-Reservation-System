package com.ocsr.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocsr.bean.CarBean;
import com.ocsr.service.CarSearchService;

/**
 * Servlet implementation class CarSearchControl
 */
public class CarSearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarSearchControl() {
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
		String carid=request.getParameter("carid");
		CarBean carbean=new CarBean();
		carbean.setCarId(carid);
		CarSearchService cancelService=new CarSearchService();
		String result=cancelService.carSearch(carbean);
	

		
		 if(result=="")
		 {
		HttpSession session=request.getSession(true);
		session.setAttribute("Search", "invalid");
		response.sendRedirect("UpdateCarDetails.jsp");
		 }
		 else
		 {
			 	String[] temp=result.split("/");
				HttpSession session=request.getSession(true);
				session.setAttribute("Search", "valid");
				session.setAttribute("CARID", temp[0]);
				session.setAttribute("RENT", temp[1]);
				session.setAttribute("NUMBERPLATE", temp[2]);
				response.sendRedirect("UpdateCarDetails.jsp");
		 }
	}

}
