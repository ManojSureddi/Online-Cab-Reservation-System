package com.ocsr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ocsr.bean.GeneralBean;
import com.ocsr.utils.Connector;

public class RentalBookingDao {

public String rentalBooking(GeneralBean generalBean)
{
	String result=null;
	try {
		Connection connection=Connector.getConnection();
		PreparedStatement ps=null;
		PreparedStatement psDelete=null;
		ResultSet rs=null;
		
		ps=connection.prepareStatement("select * from temp_ocsr_booking where RESERVATION_ID= ?");
		ps.setString(1, generalBean.getBookId());
		System.out.println( generalBean.getBookId());
		rs=ps.executeQuery();
		if(rs.next())
		{
			
			psDelete=connection.prepareStatement("Delete from temp_ocsr_booking where BOOKING_ID=?");
			psDelete.setString(1,generalBean.getBookId());
			psDelete.executeUpdate();
			connection.commit();
			result="Deleted Successfully";
			
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

}
