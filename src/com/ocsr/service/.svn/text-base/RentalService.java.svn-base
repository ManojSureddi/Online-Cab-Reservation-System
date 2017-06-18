package com.ocsr.service;

import java.util.ArrayList;

import com.ocsr.bean.RentalBean;
import com.ocsr.dao.RentalDao;

public class RentalService {

	public String rentCabService(RentalBean rentalBean) {
		
		RentalDao rentalDao=new RentalDao();
		return rentalDao.rentCabDao(rentalBean);
		}

	public String makePaymentService(RentalBean rentalBean, String cardType) {
		RentalDao rentalDao2=new RentalDao();
		return rentalDao2.makePaymentDao(rentalBean,cardType);
		
	}

	

	public String rentCabStoreService(RentalBean rentalBean) {
	

		RentalDao rentalDao1=new RentalDao();
		return rentalDao1.rentCabStoreDao(rentalBean);
	}
		
	
	}

	