package com.ocsr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ocsr.utils.Connector;

public class FetchDAO {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
public String fetchCarMake(){
	String make="<option value=\"-1\">Select Car Make</option>";
	try {
		con=Connector.getConnection();
		ps=con.prepareStatement("select distinct(carMake) from ocsr_fleet ");
		rs=ps.executeQuery();
		while(rs.next()){
			make+="<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>";
		}
		System.out.println(make);
		return make;
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";
}
public String fetchCarModel(String make){
	String model="<option value=\"-1\">Select Car Model</option>";
	try {
		con=Connector.getConnection();
		ps=con.prepareStatement("select distinct(FLEETTYPE) from ocsr_fleet where carmake=? ");
		ps.setString(1, make);
		rs=ps.executeQuery();
		while(rs.next()){
			model+="<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>";
		}
		System.out.println(model);
		return model;
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";
}

public String fetchCarType(String make,String type){
	String model="<option value=\"-1\">Select Car Model</option>";
	try {
		con=Connector.getConnection();
		ps=con.prepareStatement("select distinct(CARMODEL) from ocsr_fleet where carmake=? and fleettype=?");
		ps.setString(1, make);
		ps.setString(2, type);
		rs=ps.executeQuery();
		while(rs.next()){
			model+="<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>";
		}
		System.out.println(model);
		return model;
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";
}
public String fetchAddress(String userid) {
	String model="";
	try {
		con=Connector.getConnection();
		ps=con.prepareStatement("select ADDRESS from ocsr_users where user_id=?");
		ps.setString(1, userid);

		rs=ps.executeQuery();
		while(rs.next()){
			model=rs.getString(1);
		}
		System.out.println(model);
		return model;
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "";
}
}
