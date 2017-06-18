package com.ocsr.service;

import com.ocsr.bean.CarBean;
import com.ocsr.dao.CarSearchDao;

public class CarSearchService {
String result=null;
String resupd=null;
public String carSearch(CarBean carbean)
{
	CarSearchDao cardao=new CarSearchDao();
	result=cardao.carSearch(carbean);
	return result;
}
public String carUpdate(CarBean carbean)
{
	CarSearchDao cardao1=new CarSearchDao();
	resupd=cardao1.carUpdate(carbean);
	return resupd;
}

}
