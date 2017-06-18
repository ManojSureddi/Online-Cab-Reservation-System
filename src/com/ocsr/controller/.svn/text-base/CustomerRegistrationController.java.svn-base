package com.ocsr.controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ocsr.bean.CustomerBean;
import com.ocsr.bean.User;
import com.ocsr.service.CustomerRegistrationService;

/**
 * Servlet implementation class CustomerRegistrationController
 */
@WebServlet("/CustomerRegistrationController")
public class CustomerRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerRegistrationController() {
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
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		
		String address=request.getParameter("address");
		String gender=request.getParameter("gender");
		String dateInString=request.getParameter("date");
		
	/*	int date=Integer.parseInt(dateInString);
		String month=request.getParameter("month");
		String yearInString=request.getParameter("year");
		int year=Integer.parseInt(yearInString);
		String dob=date+"/"+"/"+month+"/"+year;
		
		*/

		
		
		String trackingnumber=request.getParameter("trackingnumber");

		String licensenumber=request.getParameter("licensenumber");
		String password=request.getParameter("password");
		String confirmpassword=request.getParameter("confirmpassword");
		
		
		int firstvalue=Integer.parseInt(request.getParameter("fv"));
		
		int secondvalue=Integer.parseInt(request.getParameter("sv"));
		int result=Integer.parseInt(request.getParameter("result"));
		int total=firstvalue+secondvalue;
		
		System.out.println(total+"\n"+result);
		if(total!=result){
			HttpSession session=request.getSession(true);
			session.setAttribute("capcha", "1");
			response.sendRedirect("CustomerRegistration.jsp");
		}

		else{
		
		
		CustomerBean customerBean=new CustomerBean();
		 customerBean.setName(name);
		 customerBean.setEmail(email);
		 customerBean.setPhone(phone);
		 customerBean.setHomeAddress(address);
		 customerBean.setGender(gender);
		 customerBean.setDob(dateInString);
		 customerBean.setTrackingNumber(trackingnumber);
		 customerBean.setLicenceNumber(licensenumber);
		 customerBean.setPassword(password);
		 CustomerRegistrationService custregistrationService=new CustomerRegistrationService();
		 String User_Id=custregistrationService.registerCustomer(customerBean);
		 if(User_Id=="")
		 {
		HttpSession session=request.getSession(true);
		session.setAttribute("CustomerRegistration", "invalid");
		response.sendRedirect("CustomerRegistration.jsp");
		 }
		 else
		 {
				HttpSession session=request.getSession(true);
				session.setAttribute("CustomerRegistration", "valid");
				response.sendRedirect("CustomerRegistration.jsp");
		 }
		 
		}
		 
		 
	}

}
