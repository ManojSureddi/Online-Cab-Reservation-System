package com.ocsr.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ocsr.bean.FeedbackBean;
import com.ocsr.utils.*;
public class FeedbackDao {
	Connection con=null;
	Statement st=null;
	PreparedStatement ps=null;
	PreparedStatement ps2=null;
	String feedbackId=null;
	int count=0;
	public boolean submitFeedback(FeedbackBean feedbackBean){
		try{
			con=Connector.getConnection();
			ps2=con.prepareStatement("select count(*) from ocsr_Feedback");
			ResultSet rs = ps2.executeQuery();
			if(rs.next()){
				count=Integer.parseInt(rs.getString(1));
			}
			    feedbackId="f"+(count+1);
				ps = con.prepareStatement("insert into ocsr_feedback values(?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1, feedbackId);
				ps.setString(2, feedbackBean.getCity());
				ps.setString(3, feedbackBean.getFeedbackCategory());
				ps.setString(4, feedbackBean.getFeedbackType());
				ps.setString(5, feedbackBean.getName());
				ps.setString(6, feedbackBean.getEmail());
				ps.setString(7, feedbackBean.getContactNumber());
				ps.setString(8, feedbackBean.getDateOfTrip());
				ps.setString(9, feedbackBean.getCarNumber());
				ps.setString(10, feedbackBean.getMessage());
				ps.executeUpdate();
			
		}
	
	
		catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
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
		return true;

	}

	
	
}


