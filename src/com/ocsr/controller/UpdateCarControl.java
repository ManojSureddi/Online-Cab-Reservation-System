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
 * Servlet implementation class UpdateCarControl
 */
public class UpdateCarControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCarControl() {
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
		CarBean carbean1=new CarBean();
		CarSearchService service1=new CarSearchService();
		HttpSession session=request.getSession(true);
		Object sess=session.getAttribute("CARID");
		String carid=sess.toString();
	String carFeatures=request.getParameter("carfeatures");
	 String ren=request.getParameter("rent");
	 System.out.println(ren);
	double rent=Double.parseDouble(ren);
	String numberplate=request.getParameter("numberplate");
	
	carbean1.setFeatures(carFeatures);
	carbean1.setRentPerDay(((int)rent));
	carbean1.setCarNumberPlate(numberplate);
	carbean1.setCarId(carid);
	String resupd=service1.carUpdate(carbean1);
	 if(!(resupd==""))
	 {
	
	session.setAttribute("Update", "valid");
	response.sendRedirect("UpdateCarDetails.jsp");
	 }
	 
	}
	}


