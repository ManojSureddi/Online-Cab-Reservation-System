package com.ocsr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ocsr.bean.CarBean;
import com.ocsr.utils.Connector;


public class CarSearchDao {
	String carid="";
	public String carSearch(CarBean carbean)
	{
		String result=null;
		carid=carbean.getCarId();
		try {
			Connection connection=Connector.getConnection();
			PreparedStatement ps=null;
			ResultSet rs=null;
			ps=connection.prepareStatement("select * from ocsr_fleet where CAR_ID=?");
			ps.setString(1, carid);
			rs=ps.executeQuery();
			if(rs.next())
			{
				result=rs.getString(1);
				result= result+"/"+rs.getDouble(9);
				result=result+"/"+rs.getString(10);
				
			}
			else
			{
				result="";
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
	public String carUpdate(CarBean carbean)
	{
		String result="";
		try {
			Connection connection=Connector.getConnection();
			PreparedStatement ps1=null;
			ResultSet rs1=null;
			ps1=connection.prepareStatement("update ocsr_fleet set FEATURES=?,RENT_PER_DAY=?,CAR_NUMBER_PLATE=? where CAR_ID=?");
			ps1.setString(1, carbean.getFeatures());
			ps1.setInt(2, carbean.getRentPerDay());
			ps1.setString(3, carbean.getCarNumberPlate());
			ps1.setString(4, carbean.getCarId());
			
			int a=ps1.executeUpdate();
			System.out.println(a+carbean.getCarId());
			connection.commit();
			result="updated";
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
	
}
