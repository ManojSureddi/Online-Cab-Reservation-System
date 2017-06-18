package com.ocsr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ocsr.bean.GeneralBean;
import com.ocsr.utils.Connector;

public class CancelReservationDao {

	public String cancelRenting(GeneralBean generalBean)
	{
		String result=null;
		try {
			Connection connection=Connector.getConnection();
			PreparedStatement ps=null;
			PreparedStatement psDelete=null;
			ResultSet rs=null;
			
			ps=connection.prepareStatement("select * from ocsr_rental where RESERVATION_ID=?");
			ps.setString(1, generalBean.getReservationId());
			rs=ps.executeQuery();
			if(rs.next())
			{
				
				psDelete=connection.prepareStatement("Delete from ocsr_rental where RESERVATION_ID=?");
				psDelete.setString(1,generalBean.getReservationId());
				System.out.println(generalBean.getReservationId());
				psDelete.executeUpdate();
				connection.commit();
				result="Cancelled Successfully";
				
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
