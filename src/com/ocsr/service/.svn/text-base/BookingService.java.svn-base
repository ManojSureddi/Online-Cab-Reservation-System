package com.ocsr.service;

import com.ocsr.dao.BookingDAO;
import com.ocsr.bean.Bookingbean;
;
public class BookingService {
	public String bookingService(Bookingbean bookingbean)
	{
		BookingDAO bdao=new BookingDAO();
		return bdao.Bookacab(bookingbean);
		
	}
	public String makePaymentService(Bookingbean bean,String type)
	{
		BookingDAO dao1=new BookingDAO();
		String payment=dao1.makePayment(bean,type);
		return payment;
	}
	public String bookCabStoreService(Bookingbean bean)
	{
		String book="";
		BookingDAO dao2=new BookingDAO();
		book=dao2.bookDrive(bean);
		return book;
	}
	

}
