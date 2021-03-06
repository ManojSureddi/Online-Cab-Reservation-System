package com.ocsr.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocsr.bean.RentalBean;
import com.ocsr.service.RentalService;
/**
 * Servlet implementation class rentalcontroller
 */
public class RentalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RentalController() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		String value1=request.getParameter("rental");
	
		System.out.println(value1);
		if(value1.equalsIgnoreCase("rental"))
		{
			RentalBean rentalBean=new RentalBean();
		
		String pickUpDate=request.getParameter("pdate");
		rentalBean.setPickUpDate(pickUpDate);
		String pickHours=request.getParameter("phours");
		String pickMinutes=request.getParameter("pminutes");
		String pickUpTime=pickHours+":"+pickMinutes;
		rentalBean.setPickUpTime(pickUpTime);
		String pickUplocation= request.getParameter("pickuplocation");
		rentalBean.setPickUpLocation(pickUplocation);
		String dropDate=request.getParameter("ddate");
		rentalBean.setDropDate(dropDate);
		String dropHours=request.getParameter("dhours");
		String dropMinutes=request.getParameter("dminutes");
		String dropTime=dropHours+":"+dropMinutes;
		rentalBean.setDropTime(dropTime);
		String dropLocation= request.getParameter("droplocation");
		rentalBean.setDropLocation(dropLocation);
		String noOfDays=request.getParameter("numberofdays");
		rentalBean.setNoOfDays(Integer.parseInt(noOfDays));
		System.out.println(rentalBean.getNoOfDays());
		String carMake=request.getParameter("carmake");
		rentalBean.setCarMake(carMake);
		String carModel=request.getParameter("carmodel");
		rentalBean.setCarModel(carModel);
		String carType=request.getParameter("cartype");
		rentalBean.setCarType(carType);
		String[] temp=request.getParameterValues("features");
		String comma="";
		String temp2="";
for(String count:temp){
temp2+=comma+count;
comma=",";
}
System.out.println(temp2);
		rentalBean.setFeatures(temp2);
		String SourceCity=request.getParameter("fulladdress");
		rentalBean.setSourceCity(SourceCity);
		System.out.println(rentalBean.getSourceCity());
		String DestinationCity=request.getParameter("fulldestaddress");
		rentalBean.setDestinationCity(DestinationCity);
		System.out.println(rentalBean.getDestinationCity());
		RentalService rentalService=new RentalService();
		String rentalSuccess=rentalService.rentCabService(rentalBean);
		rentalBean.setReservationId(rentalSuccess);
		System.out.println("res "+rentalBean.getReservationId());
		if(rentalSuccess!=null)
		{
			System.out.println(rentalSuccess);
			System.out.println("in session");
			HttpSession session=request.getSession(true);
			session.setAttribute("rconfirm",rentalSuccess);
			session.setAttribute("obj",rentalBean);
	response.sendRedirect("RentalConfirm.jsp");
		}
		else
		{
			System.out.println("out session");
			HttpSession session=request.getSession(true);
			session.setAttribute("rconfirm","nocar");
			System.out.println("else");
			response.sendRedirect("RentalConfirm.jsp");
			
		}
		}
		
		
	



		if(value1.equalsIgnoreCase("correct"))
		{
			HttpSession session=request.getSession();
			RentalBean rentalBean=(RentalBean) session.getAttribute("obj");
			String cardType=request.getParameter("cardtype");
			RentalService rentalService2=new RentalService();
			System.out.println(rentalBean.getReservationId());
			String payment=rentalService2.makePaymentService(rentalBean,cardType);	
			if(payment!=null)
			{
				System.out.println(payment);
				System.out.println(rentalBean.getPickUpDate());
				String rentalStore=rentalService2.rentCabStoreService(rentalBean);

				if(rentalStore!=null)
				{
					Object tempUserId=session.getAttribute("userid");
					String userId=tempUserId.toString();
					rentalBean.setUserId(userId);
					session.setAttribute("pconfirm",payment);
					session.setAttribute("resconfirm",rentalStore);
					response.sendRedirect("PaymentConfirmation.jsp");
				}
				else
				{
					System.out.println("else");
					response.sendRedirect("PaymentConfirmation.jsp");

				}

			}

		}

	}
}
