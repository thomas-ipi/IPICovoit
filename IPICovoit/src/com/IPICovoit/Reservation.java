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

@WebServlet("/Reserver")
public class Reservation extends HttpServlet{	
	private static String FIELD_DRIVER = "id";
	private static String FIELD_PASSAGER = "id";
	private static String VIEW_PAGES_URL = "/";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String mailConducteur = request.getParameter(FIELD_DRIVER);
		String mailPassager = request.getParameter(FIELD_PASSAGER);
		String sql = "INSERT INTO ipicoivoir_bdd.Reservation (`mailConducteur`, `mailPassager`) "
				+ "VALUES ('"+mailConducteur+"', '"+mailPassager+"')";
		
		try {
			Connection con = BDDConnect.connect();
			Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.close();
			request.setAttribute("successMessage", "Votre réservation a bien été enregistrée.");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "Votre réservation a échouée. Merci de réessayer ultérieurement.");
		}
		this.getServletContext().getRequestDispatcher(VIEW_PAGES_URL).include( request, response );
	}
}
