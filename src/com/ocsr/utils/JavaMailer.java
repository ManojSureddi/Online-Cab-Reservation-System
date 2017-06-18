package com.ocsr.utils;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
public class JavaMailer {

public static boolean sendMail(String toAddr,String sub,String mailMessage){
	 // Recipient's email ID needs to be mentioned.
    String to = "856340@tcs.com";

    // Sender's email ID needs to be mentioned
    String from = "856340@tcs.com";

    // Assuming you are sending email from localhost
    String host = "www.tcs.com";
System.out.println("sdasdasdasd");
    // Get system properties
    Properties properties = System.getProperties();

    // Setup mail server
    properties.setProperty("mail.smtp.host", host);

    // Get the default Session object.
    Session session = Session.getDefaultInstance(properties);

    try{
       // Create a default MimeMessage object.
       MimeMessage message = new MimeMessage(session);

       // Set From: header field of the header.
       message.setFrom(new InternetAddress(from));

       // Set To: header field of the header.
       message.addRecipient(Message.RecipientType.TO,
                                new InternetAddress(to));

       // Set Subject: header field
       message.setSubject(sub);

       // Now set the actual message
       message.setText(mailMessage);

       // Send message
       Transport.send(message);
       System.out.println("Sent message successfully....");
       return true;
    }catch (MessagingException mex) {
    	 System.out.println("Mail couldnot be sent");
    	
       mex.printStackTrace();
       return false;
   
 }
}


}
