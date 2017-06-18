package com.ocsr.controller;

import com.ocsr.utils.*;
import com.ocsr.bean.*;
import com.ocsr.service.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FeedbackController
 */
public class FeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FeedbackController() {
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
		FeedbackBean feedbackBean = new FeedbackBean();
		FeedbackService feedbackService = new FeedbackService();
		feedbackBean.setCity(request.getParameter("city"));
		feedbackBean.setFeedbackCategory(request
				.getParameter("feedbackcategory"));
		feedbackBean.setFeedbackType(request.getParameter("feedbacktype"));
		feedbackBean.setName(request.getParameter("name"));
		feedbackBean.setEmail(request.getParameter("emailid"));
		feedbackBean.setContactNumber(request.getParameter("contactnumber"));
		feedbackBean.setCarNumber(request.getParameter("carnumber"));
		feedbackBean.setMessage(request.getParameter("message"));
		String day = request.getParameter("date");
		feedbackBean.setDateOfTrip(day);
		boolean feedback = feedbackService.submitFeedback(feedbackBean);

		if (feedback == true) {
			System.out.println("success");
			response.sendRedirect("Feedback.jsp");
		}
		// TODO Auto-generated method stub
	}

}
