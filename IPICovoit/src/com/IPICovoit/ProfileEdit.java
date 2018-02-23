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

@WebServlet("/logout")
public class ProfileEdit extends HttpServlet{
	private static String VIEW_PAGES_URL = "/profile.jsp";
	private static String FIELD_NOM = "nomProfile";
	private static String FIELD_PRENOM = "prenomProfile";
	private static String FIELD_MAIL = "mailProfile";
	private static String FIELD_ADRESSE = "adresseProfile";
	private static String FIELD_PHONE = "telephoneProfile";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String nom = request.getParameter(FIELD_NOM);
		String prenom = request.getParameter(FIELD_PRENOM);
		String mail = request.getParameter(FIELD_MAIL);
		String phone = request.getParameter(FIELD_PHONE);
		String adresse = request.getParameter(FIELD_ADRESSE);
		String sql = "UPDATE ipicoivoir_bdd.User SET nom='"+nom+"',prenom='"+prenom+"', telephone='"+phone+"', adresse='"+phone+"' WHERE mail='"+mail+"'";
		
		try {
			Connection con = BDDConnect.connect();
			Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.close();
			request.setAttribute("successMessage", "Profile mis à jour.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "La mise à jour a échouée, merci de réessayer ultérieurement.");
		}
        
		this.getServletContext().getRequestDispatcher(VIEW_PAGES_URL).include( request, response );
	}
}
