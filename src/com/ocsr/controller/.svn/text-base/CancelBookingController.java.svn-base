package com.ocsr.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocsr.bean.GeneralBean;
import com.ocsr.service.CancelBookingService;

/**
 * Servlet implementation class CancelBookingController
 */
@WebServlet("/CancelBookingController")

public class CancelBookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelBookingController() {
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
		String bookingid=request.getParameter("bookingid");
		GeneralBean generalBean=new GeneralBean();
		generalBean.setBookId(bookingid);
		CancelBookingService cancelService=new CancelBookingService();
		String result=cancelService.cancelBooking(generalBean);
		 if(result=="")
		 {
		HttpSession session=request.getSession(true);
		session.setAttribute("Cancel", "invalid");
		response.sendRedirect("CancelBooking.jsp");
		 }
		 else
		 {
				HttpSession session=request.getSession(true);
				session.setAttribute("Cancel", "valid");
				response.sendRedirect("CancelBooking.jsp");
		 }
	}

}
