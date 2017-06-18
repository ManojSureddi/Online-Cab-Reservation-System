package com.ocsr.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocsr.bean.GeneralBean;
import com.ocsr.service.CancelReservationService;


/**
 * Servlet implementation class cancelReservationController
 */
public class cancelReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cancelReservationController() {
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
		String reservationId=request.getParameter("rentalid");
		GeneralBean generalBean=new GeneralBean();
		generalBean.setReservationId(reservationId);
		CancelReservationService cancelService=new CancelReservationService();
		String result=cancelService.cancelRenting(generalBean);
		 if(result=="")
		 {
		HttpSession session=request.getSession(true);
		session.setAttribute("Cancel", "invalid");
		response.sendRedirect("CancelRenting.jsp");
		 }
		 else
		 {
				HttpSession session=request.getSession(true);
				session.setAttribute("Cancel", "valid");
				response.sendRedirect("CancelRenting.jsp");
		 }
	}
	}


