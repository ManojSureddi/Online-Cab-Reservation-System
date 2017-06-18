package com.ocsr.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocsr.bean.Bookingbean;
import com.ocsr.service.BookingService;

/**
 * Servlet implementation class BookingController
 */
@WebServlet("/BookingController")
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public BookingController() {
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
		String value=request.getParameter("booking");
		if(value.equals("booking"))
		{
			Bookingbean bookingbean = new Bookingbean();
			String date = "";
			String bookId = "";

			bookingbean.setBookingDate(request.getParameter("date"));
			System.out.println(bookingbean.getBookingDate());
			bookingbean.setSourceCity(request.getParameter("sourcecity"));
			bookingbean.setSource(request.getParameter("FullAddress"));
			bookingbean.setDestinationCity(request.getParameter("destinationcity"));
			bookingbean.setDestination(request.getParameter("FulldestAddress"));
			String time = "";
			time = request.getParameter("hours") + ":"
					+ request.getParameter("minutes");
			bookingbean.setStartTime(time);
			String days = request.getParameter("numberofdays");
			bookingbean.setNumberOfDays(Integer.parseInt(days));
			bookingbean.setCarMake(request.getParameter("carmake"));
			bookingbean.setCarType(request.getParameter("cartype"));
			bookingbean.setCarModel(request.getParameter("carmodel"));
			String[] temp=request.getParameterValues("features");
			String comma="";
			String temp2="";
			for(String count:temp){
				temp2+=comma+count;
				comma=",";
			}
			System.out.println(temp2);
			bookingbean.setFeatures(temp2);

			BookingService object = new BookingService();
			bookId = object.bookingService(bookingbean);
			HttpSession session = request.getSession(true);
			if (bookId != null) {
				System.out.println("In herre");

				session.setAttribute("bookId", bookId);
				session.setAttribute("obj", bookingbean);
				session.setAttribute("value","car");
				response.sendRedirect("BookingConfirmation.jsp");
			} else {
				System.out.println("In else");
				response.sendRedirect("BookingConfirmation.jsp");
			}
		}
		if(value.equalsIgnoreCase("correct"))
		{
			HttpSession session=request.getSession(true);
			Bookingbean bookingBean=(Bookingbean) session.getAttribute("obj");
			String cardType=request.getParameter("cardtype");
			if(session.getAttribute("userid")!=null){
			bookingBean.setUserId(session.getAttribute("userid")+"");
			}
			else{
				bookingBean.setUserId("U13");
			}
			BookingService bookingService2=new BookingService();
			System.out.println(bookingBean.getBookingId());
			String payment=bookingService2.makePaymentService(bookingBean,cardType);	
			if(payment!=null)
			{
				System.out.println(payment);
				System.out.println(bookingBean.getBookingDate());
				String bookingStore=bookingService2.bookCabStoreService(bookingBean);

				if(bookingStore!=null)
				{
					session.setAttribute("pconfirm",payment);
					session.setAttribute("bconfirm",bookingStore);
					response.sendRedirect("BookingPaymentConfirmation.jsp");
				}
				else
				{
					System.out.println("else");
					response.sendRedirect("BookingPaymentConfirmation.jsp");

				}

			}

		}

	}


}
