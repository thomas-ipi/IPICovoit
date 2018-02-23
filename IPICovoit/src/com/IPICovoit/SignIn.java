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

@WebServlet("/signIn")
public class SignIn extends HttpServlet{
	private static String VIEW_PAGES_URL = "/";
	private static String FIELD_NOM = "nom";
	private static String FIELD_PRENOM = "prenom";
	private static String FIELD_MAIL = "mail";
	private static String FIELD_MDP = "mdp";
	private static String FIELD_CLASSE = "classe";
	private static String FIELD_PHONE = "phone";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String nom = request.getParameter(FIELD_NOM);
		String prenom = request.getParameter(FIELD_PRENOM);
		String mail = request.getParameter(FIELD_MAIL);
		String mdp = request.getParameter(FIELD_MDP);
		String phone = request.getParameter(FIELD_PHONE);
		String classe = request.getParameter(FIELD_CLASSE);
		String sql = "INSERT INTO ipicoivoir_bdd.User (`nom`, `prenom`, `telephone`, `mail`, `classe`, `mdp`) VALUES ('"+nom+"', '"+prenom+"', '"+phone+"', '"+mail+"', '"+classe+"', '"+mdp+"')";
		
		try {
			Connection con = BDDConnect.connect();
			Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.close();
			request.setAttribute("successMessage", "Vous venez d'être inscrit. Vous pouvez dès à présent vous connecter.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "L'inscription a échouée, merci de réessayer ultérieurement.");
		}
        
		this.getServletContext().getRequestDispatcher(VIEW_PAGES_URL).include( request, response );
	}
}
