package com.ocsr.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {

	public static Connection getConnection() throws ClassNotFoundException,
			SQLException {
		String serverAddr = "172.24.137.30";
		String port = "1521";
		String sid = "orcl";
		String url = "jdbc:oracle:thin:@" + serverAddr + ":" + port + ":" + sid;
		String username = "e863674";
		String pass = "Srkr0904";
		Connection con = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url,username,pass);
		return con;
	}
}
