package com.ocsr.service;

import com.ocsr.bean.CarBean;
import com.ocsr.dao.CarDAO;

public class CarService {
public String registerCar(CarBean bean){
	CarDAO carDAO= new CarDAO();
	String res=carDAO.registerCar(bean);
	return res;
}
}
