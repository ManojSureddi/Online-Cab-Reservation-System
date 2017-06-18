package com.ocsr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ocsr.bean.CarBean;
import com.ocsr.utils.Connector;

public class CarDAO {
	Connection connection = null;

	public String registerCar(CarBean bean) {
		String role = "";
		Statement st = null;
		PreparedStatement ps = null;
		 int count=0;

		try {
			connection = Connector.getConnection();
			System.out.println(connection);
			ps = connection
					.prepareStatement("select * from ocsr_fleet where VIN =? or CAR_NUMBER_PLATE=?");

			ps.setString(1, bean.getVin());
			ps.setString(2, bean.getCarNumberPlate());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				System.out.println(bean.getVin());
				return "";
			}
			else{
				ps= connection
						.prepareStatement("select count(*) from ocsr_fleet ");
				rs=ps.executeQuery();
				String tempcount="0";
				if(rs.next())
				{
					tempcount=rs.getString(1);
				}
			//	tempcount=tempcount.substring(1,tempcount.length());
				count=Integer.parseInt(tempcount)+1;
			String	carId="C"+(count+1);
			bean.setCarId(carId);
				ps = connection
						.prepareStatement("insert into ocsr_fleet values(?,?,?,?,?,?,?,?,?,?,?,?)");

				ps.setString(1, bean.getCarId());
				ps.setString(2, bean.getVin());
				ps.setString(3, bean.getCity());
				ps.setString(4, bean.getCarMake());
				ps.setString(5, bean.getCarModel());
				ps.setInt(6, bean.getCapacity());
				ps.setString(7, bean.getFleetType());
				ps.setString(8, bean.getFeatures());
				ps.setInt(9, bean.getRentPerDay());
				ps.setString(10, bean.getCarNumberPlate());
				ps.setString(11, bean.getStatus());
				ps.setInt(12, 10000);
					ps.executeUpdate();
					connection.commit();
					return carId;
	
		
			}

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (st != null) {
					st.close();
				}
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return "";
	}
}
