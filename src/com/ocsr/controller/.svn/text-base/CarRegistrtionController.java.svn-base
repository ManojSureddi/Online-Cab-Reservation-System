package com.ocsr.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JViewport;

import com.ocsr.bean.CarBean;
import com.ocsr.service.CarService;
import com.ocsr.utils.JavaMailer;

/**
 * Servlet implementation class CarRegistrtionController
 */
@WebServlet("/CarRegistrationController")
public class CarRegistrtionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CarRegistrtionController() {
		super();
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
		String referer = request.getParameter("referer");

		if (referer.equals("1")) {
			CarBean bean = new CarBean();
			bean.setVin(request.getParameter("vin"));
			bean.setCity(request.getParameter("source"));
			bean.setCarMake(request.getParameter("carmake"));
			bean.setCarModel(request.getParameter("carmodel"));
			bean.setCapacity(Integer.parseInt(request.getParameter("capacity")));
			bean.setFleetType(request.getParameter("fleettype"));
			String[] temp = request.getParameterValues("features");
			String comma = "";
			String temp2 = "";
			for (String count : temp) {
				temp2 += comma + count;
				comma = ",";
			}
			System.out.println(temp2);
			bean.setFeatures(temp2);
			bean.setRentPerDay(Integer.parseInt(request
					.getParameter("rentperday")));
			bean.setCarNumberPlate(request.getParameter("carnumberplate"));
			bean.setStatus(request.getParameter("status"));
			CarService carService = new CarService();
String res=carService.registerCar(bean);
HttpSession sess= request.getSession(true);
if(res!=""){
	
	sess.setAttribute("carreg","done");
}
else{
	sess.setAttribute("carreg","undone");
}
response.sendRedirect("CarRegistrations.jsp");
		}

	}

}
