	package com.IPICovoit;

	import java.io.IOException;
	import java.util.HashMap;
	import java.util.Map;
	import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet{	
	private static String FIELD_ID = "id";
	private static String FIELD_MDP = "mdp";
	private static String VIEW_PAGES_URL = "/";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
        String mail = request.getParameter(FIELD_ID);
        String mdp = request.getParameter(FIELD_MDP);
        String sql = "SELECT * FROM  ipicoivoir_bdd.User";
		HttpSession session = request.getSession();
		try {
			Connection con = BDDConnect.connect();
			Statement stmt = con.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);
	        
	        boolean connect = false;
	        //STEP 5: Extract data from result set
	        while(rs.next()){
	           //Retrieve by column name
	           String unMail = rs.getString("mail");
	           String unMdp = rs.getString("mdp");
	           if(mail.equals(unMail)) {
	        	   if(mdp.equals(unMdp))
	        	   {
	        		   connect = true;
	        		   session.setAttribute("nom", rs.getString("nom"));
	        		   session.setAttribute("prenom", rs.getString("prenom"));
	        		   session.setAttribute("mail", rs.getString("mail"));
	        		   session.setAttribute("telephone", rs.getString("telephone"));
	        		   session.setAttribute("classe", rs.getString("classe"));
	        		   connect = true;
	        		   session.setAttribute("connected", connect);

	        	   }
	           }
	        }
	        con.close();
	        if(connect) {
	            request.setAttribute("successMessage", "Vous venez de vous connecter.");
	        }
	        else
	        {
	        	request.setAttribute("errorMessage", "Mauvais Id ou MDP");
	        }
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "Impossible de se connecter, veuiller réessayer ultérieurement.");
		}
		this.getServletContext().getRequestDispatcher(VIEW_PAGES_URL).include( request, response );
	}
}
