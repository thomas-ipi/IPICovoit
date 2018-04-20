package com.IPICovoit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;

/**
 * Servlet implementation class GetTrajet
 */
@WebServlet("/GetTraject")
public class GetTraject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTraject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("arg0");
		String fumeur = request.getParameter("arg1");
		String date = request.getParameter("arg2");
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MM-yyyy");
		try {
			Date laDate = formatter1.parse(date);
			date = formatter2.format(laDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql = "SELECT pointDeDepart, pointDeDepartLat, pointDeDepartLng, date,"
				+ "nom, prenom, fumeur, retour, nbplaces, mail "
				+ "FROM  ipicoivoir_bdd.Trajet t , ipicoivoir_bdd.User u"
				+ " WHERE date = '"+date+"'"
				+ " AND t.mailUserConducteur = u.mail";
 		if(fumeur.compareTo("twice") != 0)
		{
			sql += " AND fumeur = '"+fumeur+"'";
		}
		if(type.compareTo("twice") != 0)
		{
			sql += "retour = '"+type+"' OR retour = 'twice'";
		}
		//String sql = "SELECT * FROM  ipicoivoir_bdd.Trajet";
		try {
			Connection con = BDDConnect.connect();
			Statement stmt = con.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);
	        response.setContentType("text/JSON");
	        JsonObject jsonResponse = new JsonObject();	
	        JsonArray data = new JsonArray();
	        while(rs.next() ) {
		        JsonArray row = new JsonArray();
		        row.add(new JsonPrimitive(rs.getString("pointDeDepart")));	
		        row.add(new JsonPrimitive(rs.getString("pointDeDepartLat")));
		        row.add(new JsonPrimitive(rs.getString("pointDeDepartLng")));
		        row.add(new JsonPrimitive(rs.getString("date")));
		        row.add(new JsonPrimitive(rs.getString("nom")));
		        row.add(new JsonPrimitive(rs.getString("prenom")));
		        row.add(new JsonPrimitive(rs.getString("fumeur")));
		        row.add(new JsonPrimitive(rs.getString("retour")));
		        row.add(new JsonPrimitive(rs.getString("nbplaces")));
		        row.add(new JsonPrimitive(rs.getString("mail")));
		        
		        data.add(row);
	        }
	        jsonResponse.add("trajets", data);
	      
	        PrintWriter out = response.getWriter();

	        out.print(jsonResponse);
	        out.close();
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}
