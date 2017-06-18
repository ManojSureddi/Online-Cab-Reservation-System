package com.ocsr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ocsr.bean.CustomerBean;
import com.ocsr.utils.Connector;
import com.ocsr.utils.Encryptor;

public class CustomerRegistrationDao {
	
public String registerCustomer(CustomerBean customerBean)
{
	String User_Id=null;
	try {
		Connection connection=Connector.getConnection();
		PreparedStatement ps=null;
		PreparedStatement psInsert=null;
		PreparedStatement psCount=null;
		ResultSet rs=null;
		ResultSet rsCount=null;
		String Role="User";
		int count=0;
		
		
		ps=connection.prepareStatement("Select * From OCSR_Users where EMAIL=?");
		ps.setString(1, customerBean.getEmail());
		rs=ps.executeQuery();
		if(rs.next())
		{
			User_Id="";
		}
			
		else
		{
			psCount=connection.prepareStatement("Select count(*) from OCSR_Users");
			rsCount=psCount.executeQuery();
			if(rsCount.next())
			{
				count=Integer.parseInt(rsCount.getString(1))+1;
			}
		    User_Id="U"+count;
		    String password=Encryptor.encryptData(customerBean.getPassword());
			psInsert=connection.prepareStatement("Insert into OCSR_Users values(?,?,?,?,?,?,?,?,?,?,?)");
			psInsert.setString(1,User_Id);
			psInsert.setString(2, customerBean.getEmail());
			psInsert.setString(3, customerBean.getName());
			psInsert.setString(4, customerBean.getPhone());
			psInsert.setString(5, customerBean.getHomeAddress());
			psInsert.setString(6, customerBean.getDob());
			psInsert.setString(7, customerBean.getGender());
			psInsert.setString(8,customerBean.getTrackingNumber());
			psInsert.setString(9,customerBean.getLicenceNumber());
			psInsert.setString(10, password);
			psInsert.setString(11, Role);
			psInsert.executeUpdate();
			
			connection.commit();
			
			
		}
	} catch (ClassNotFoundException e) {
	
		e.printStackTrace();
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return User_Id;
	
}
}
