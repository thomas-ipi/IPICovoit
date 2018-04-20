package com.IPICovoit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
		/*String sql = "SELECT * FROM  ipicoivoir_bdd.Trajet"
				+ " WHERE retour = '"+type
				+ "' AND fumeur = '"+fumeur
				+ "' AND date = '"+date+"'";*/
		String sql = "SELECT * FROM  ipicoivoir_bdd.Trajet";
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
