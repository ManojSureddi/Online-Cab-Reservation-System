package com.ocsr.service;

import com.ocsr.dao.CancelBookingDao;
import com.ocsr.dao.CustomerRegistrationDao;
import com.ocsr.bean.CustomerBean;
import com.ocsr.bean.GeneralBean;

public class CancelBookingService {
	String result;
	public String cancelBooking(GeneralBean generalBean)
	{
		String result;
		CancelBookingDao cancelBookingDao=new CancelBookingDao();
		 result=cancelBookingDao.cancelBooking(generalBean);
		return result;
	}
}
