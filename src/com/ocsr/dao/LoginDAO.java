package com.ocsr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.ocsr.utils.Connector;
import com.ocsr.bean.LoginBean;

public class LoginDAO {
	Connection connection = null;

	public String validateCredentials(LoginBean bean) {
		String role = "";
		Statement st = null;
		PreparedStatement ps = null;

		try {
			connection = Connector.getConnection();
			System.out.println(connection + bean.getUsername()
					+ bean.getPassword());
			ps = connection.prepareStatement("select * from ocsr_users where email=? and password=?");

			 ps.setString(1,bean.getUsername());
			ps.setString(2,bean.getPassword());
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				role = rs.getString("ROLE");
				role += "/" + rs.getString("NAME");
				role += "/" + rs.getString("USER_ID");
				System.out.println(role);
				
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
		return role;

	}
}
