	package com.IPICovoit;

	import java.io.IOException;
	import java.util.HashMap;
	import java.util.Map;
import java.util.Calendar;
import java.util.Date;
	import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addTraject")
public class Conducteur extends HttpServlet{
	private static String VIEW_PAGES_URL = "/";
	private static String FIELD_ADRESSE = "adresse_maison_campus";
	private static String FIELD_ALLER = "ar";
	private static String FIELD_SMOKE = "smoke";
	private static String FIELD_BEGIN_TRAJET = "date_trajet_begin";
	private static String FIELD_END_TRAJET = "date_trajet_end";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String adresse = request.getParameter(FIELD_ADRESSE);
		String retour = request.getParameter(FIELD_ALLER);
		String smoker = request.getParameter(FIELD_SMOKE);
		String debut = request.getParameter(FIELD_BEGIN_TRAJET);
		String fin = request.getParameter(FIELD_END_TRAJET);
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		Date dateFin = null;
		Date dateDebut = null;
		HttpSession session = request.getSession();
		try {
			dateFin = formatter.parse(fin);
            dateDebut = formatter.parse(debut);

        } catch (ParseException e) {
            e.printStackTrace();
        }
		String sql = "INSERT INTO ipicoivoir_bdd.Trajet (`mailUserConducteur`, `date`, `pointDeDepart`, `retour`, `fumeur`) VALUES ";
		do
		{
			SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
			String format = formatter2.format(dateDebut);
			sql += " ('"+session.getAttribute("mail")+"', '"+format+"', '"+adresse+"', '"+retour+"', '"+smoker+"')";
			//on ajoute un jour à la date
			Calendar c = Calendar.getInstance(); 
			c.setTime(dateDebut); 
			c.add(Calendar.DATE, 1);
			dateDebut = c.getTime();
			if(dateDebut.compareTo(dateFin) <= 0)
			{
				sql += ",";
			}
		}while(dateDebut.compareTo(dateFin) <= 0);
		
		
		try {
			Connection con = BDDConnect.connect();
			Statement stmt;
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			con.close();
			request.setAttribute("successMessage", "Vos trajets sont enregistrés.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "Vos trajets n'ont pas pu être enregistrés. Merci de contacter le support.");
		}
        
		this.getServletContext().getRequestDispatcher(VIEW_PAGES_URL).include( request, response );
	}
}
