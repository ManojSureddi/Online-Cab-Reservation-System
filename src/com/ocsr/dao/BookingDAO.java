package com.ocsr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ocsr.bean.Bookingbean;
import com.ocsr.utils.Connector;

public class BookingDAO {

	
	public String Bookacab(Bookingbean bookingbean)
	{   String carId="";
		String bookId="";
		Connection con=null;
		PreparedStatement ps1=null;
		PreparedStatement ps2=null;
		PreparedStatement ps3=null;
		PreparedStatement ps4=null;
		ResultSet rs=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
	    int count=0;
		try{
		con=Connector.getConnection();
		ps3=con.prepareStatement("select car_id as carId from ocsr_fleet where carmake=? and fleettype=? and features=? and carmodel =? and car_status='1' ");

		ps3.setString(1,bookingbean.getCarMake());
		ps3.setString(2,bookingbean.getCarType());
		ps3.setString(3,bookingbean.getFeatures());
		ps3.setString(4,bookingbean.getCarModel());
		System.out.println(bookingbean.toString());
		rs1=ps3.executeQuery();
		
		while(rs1.next())
		{System.out.println("sas");
			carId=rs1.getString("carId");
			System.out.println(carId);
			bookingbean.setCarId(carId);
			break;
		}
		System.out.println(carId);
		
	if(carId!="")
		{	System.out.println("1234");
		System.out.println("in "+carId);
		ps3=con.prepareStatement("UPDATE OCSR_FlEET SET CAR_STATUS='0' WHERE CAR_ID=?" );
		ps3.setString(1,bookingbean.getCarId());
	System.out.println(ps3.executeUpdate());	
		con.commit();
		ps1=con.prepareStatement("SELECT count(*) FROM TEMP_OCSR_BOOKING");
		rs=ps1.executeQuery();
	String tempcount="0";
		while(rs.next())
		{
			System.out.println("asdsa"+rs.getString(1));
			tempcount=rs.getString(1);
		}
	//	tempcount=tempcount.substring(1,tempcount.length());
		count=Integer.parseInt(tempcount)+2;
	bookId="B"+count;
	bookingbean.setBookingId(bookId);
	System.out.println(bookId);
	
			ps2=con.prepareStatement(" insert into temp_ocsr_booking values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps2.setString(1,bookingbean.getBookingId());
			ps2.setString(2,bookingbean.getBookingDate());
			ps2.setString(3,bookingbean.getSource());
			ps2.setString(4,bookingbean.getDestination());
			ps2.setInt(5,bookingbean.getNumberOfDays());
			ps2.setDouble(6,bookingbean.getConveyance());
			ps2.setDouble(7,bookingbean.getTotalAmount());
			ps2.setString(8,bookingbean.getStartTime());
			ps2.setString(9,bookingbean.getCarId());
			ps2.setString(10,bookingbean.getDriverId());
			ps2.setString(11,bookingbean.getSourceCity());
			ps2.setString(12,bookingbean.getDestinationCity());
		    int a=ps2.executeUpdate();
		con.commit();
		}
		else
		{
			bookId=null;
		}
		
		
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try{
				if(con!=null)
				{
					con.close();
				}
				if(ps1!=null)
				{
					ps1.close();
				}
				if(ps2!=null)
				{
					ps2.close();
				}
			}catch(SQLException e)
			{
				e.printStackTrace();
			}
			
		}
		return bookId;
	
		}
	public String makePayment(Bookingbean Bean, String Type) {
		Connection con=null;
		PreparedStatement ps1=null;
		PreparedStatement ps2=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		int paymentRowId = 0;
		String paymentId=null;
		double subTotal=0.0;
		try{
			con=Connector.getConnection();
		 ps1 = con.prepareStatement("select count(*) from ocsr_payment");
	     rs1 = ps1.executeQuery();
		
		if(rs1.next())
		{
			
			paymentRowId=rs1.getInt(1);
		}
		paymentId="P"+(paymentRowId+1);
	      ps2 = con.prepareStatement("select * from ocsr_fleet");
          rs2=ps2.executeQuery();
		if(rs2.next())
		{
			subTotal=rs2.getDouble("RENT_PER_DAY");
		}
		System.out.println(subTotal);
		int noOfDays=Bean.getNumberOfDays();
		System.out.println(Bean.getNumberOfDays());
		double conveyance=Bean.getConveyance();
		double subAmount=(subTotal*noOfDays);  
		System.out.println(subAmount);
		double amount=subAmount+conveyance;
		Bean.setTotalAmount(amount);
		PreparedStatement ps3 = con.prepareStatement("insert into ocsr_payment values(?,?,?,?,?)");
		ps3.setString(1, paymentId);
		ps3.setString(2,Type);
		ps3.setDouble(3,amount);
		ps3.setDouble(4,0);
		ps3.setString(5,Bean.getBookingId());
		ps3.executeQuery();
		con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return paymentId;
	}
	public String bookDrive(Bookingbean Bean)
	{
		int bookNumber;
		int bookId = 0;
		int count=0;
		String carId = null;	
		String bookId1=null;
		try
		{

			 Connection con=Connector.getConnection();
				PreparedStatement ps7=con.prepareStatement("select * from ocsr_booking");
				 ResultSet rs5=ps7.executeQuery();
				 String tempcount="B00";
				while(rs5.next())
				{
					System.out.println("asdsa"+rs5.getString(1));
					tempcount=rs5.getString(1);

				}
				tempcount=tempcount.substring(1,tempcount.length());
				count=Integer.parseInt(tempcount)+1;
			bookId1="B"+count;
			Bean.setBookingId(bookId1);
			//	bookId1="B"+(bookId+1);
				ps7=con.prepareStatement("insert into ocsr_Booking values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps7.setString(1,bookId1);
				ps7.setString(2,Bean.getUserId());
				ps7.setString(3,Bean.getBookingDate());
				ps7.setString(4,Bean.getSource());
				ps7.setString(5,Bean.getDestination());
				ps7.setInt(6,Bean.getNumberOfDays());
				ps7.setDouble(7,Bean.getConveyance());
				ps7.setDouble(8,Bean.getTotalAmount());
				ps7.setString(9,Bean.getStartTime());
				ps7.setString(10,Bean.getCarId());
				ps7.setString(11,Bean.getDriverId());
				ps7.setString(12,Bean.getSourceCity());
				ps7.setString(13,Bean.getDestinationCity());
				bookNumber=ps7.executeUpdate();
				con.commit();
			

			

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return bookId1;
	}

	}

