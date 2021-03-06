	package com.IPICovoit;

	import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
	import java.util.Map;
import java.util.Properties;
import java.sql.*;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;

@WebServlet("/Reserver")
public class Reservation extends HttpServlet{	
	private static String FIELD_DRIVER = "mailconducteur";
	private static String FIELD_MAIL = "mail";
	private static String VIEW_PAGES_URL = "/";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mailConducteur = request.getParameter(FIELD_DRIVER);
		HttpSession session = request.getSession();
		String mailPassager = session.getAttribute(FIELD_MAIL).toString();
		
		
		String sql = "INSERT INTO ipicoivoir_bdd.Reservation (`mailConducteur`, `mailPassager`) "
				+ "VALUES ('"+mailConducteur+"', '"+mailPassager+"')";
		
		try {
			Connection con = BDDConnect.connect();
			Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.close();
			request.setAttribute("successMessage", "Votre r�servation a bien �t� enregistr�e.");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "Votre r�servation a �chou�e. Merci de r�essayer ult�rieurement.");
		}
		try {
			sendMail(mailPassager, mailConducteur);
			request.setAttribute("successMessage", "Votre r�servation a bien �t� enregistr�e, vous avez re�u un mail r�capitulatif.");
		}catch(MessagingException e) {
			request.setAttribute("errorMessage", "Le mail n'a pas pu �tre envoy�");
		}
		this.getServletContext().getRequestDispatcher(VIEW_PAGES_URL).include( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
	}
	
	private void sendMail(String passager, String conducteur) throws MessagingException{
		// Recipient's email ID needs to be mentioned.
	      String to = passager;

	      // Sender's email ID needs to be mentioned
	      String from = "ipicoivoir@alwaysdata.net";

	      // Assuming you are sending email from localhost
	      String host = "smtp-ipicoivoir.alwaysdata.net";

	      // Get system properties
	      Properties properties = System.getProperties();

	      // Setup mail server
	      properties.setProperty("mail.smtp.host", host);
	      properties.setProperty("mail.smtp.auth", "true");


	      // Get the default Session object.
	      //Session session = Session.getDefaultInstance(properties);
	      Session session = Session.getInstance(properties,
	    		  new javax.mail.Authenticator() {
	    			protected PasswordAuthentication getPasswordAuthentication() {
	    				return new PasswordAuthentication("ipicoivoir@alwaysdata.net", "IPICovoit");
	    			}
	    		  });

	      try {
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

	         // Set Subject: header field
	         message.setSubject("Vous venez de r�server un trajet chez IPICovoit.");

	         String contenu = "<h1>Merci de votre r�servation</h1>"
	         		+ "Vous pouvez d�sormais contacter votre conducteur au coordonn�es suivantes : <br/>";
	         
	         String sql = "SELECT * FROM  ipicoivoir_bdd.User WHERE mail = '"+conducteur+"'";
	 		try {
	 			Connection con = BDDConnect.connect();
	 			Statement stmt = con.createStatement();
	 	        ResultSet rs = stmt.executeQuery(sql);
	 	        while(rs.next() ) {
	 	        	contenu += rs.getString("nom")+" "+rs.getString("prenom")+"<br/>"
        					+ "Adresse : "+rs.getString("adresse")+"<br/>"
	 	            		+ "T�l�phone : "+rs.getString("telephone")+"<br/>"
            				+ "Mail : "+rs.getString("mail")+"<br/>";
	 	        	
	 	        }
	         } catch (SQLException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		}	
	 		contenu += "<strong> Merci de prendre contact avec le conducteur pour finaliser la r�servation </strong> <br/> "
     		+ "Cordialement";
	         // Now set the actual message 
	         message.setContent(contenu, "text/html; charset=utf-8");

	         // Send message
	         Transport.send(message);
	         System.out.println("Sent message successfully....");
	      } catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	}
}
