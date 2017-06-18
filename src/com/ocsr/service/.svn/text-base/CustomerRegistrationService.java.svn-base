package com.ocsr.service;

import com.ocsr.dao.CustomerRegistrationDao;
import com.ocsr.bean.CustomerBean;

public class CustomerRegistrationService {

	public String registerCustomer(CustomerBean customerBean)
	{
		String User_Id;
		CustomerRegistrationDao customerRegistrationDao=new CustomerRegistrationDao();
		User_Id=customerRegistrationDao.registerCustomer(customerBean);
		return User_Id;
		
	}
}
