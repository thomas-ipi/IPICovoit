package com.IPICovoit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.jws.WebMethod;
import javax.jws.WebService;

@WebService
public class GetTraject {

	@WebMethod(action="getTrajectsSearch")
	public ResultSet getTrajectsSearch(String type, String fumeur, String date) throws IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		date = formatter.format(date);
		String sql = "SELECT * FROM  ipicoivoir_bdd.Trajet"
				+ "WHERE retour = "+type
				+ "AND fumeur = "+fumeur
				+ "AND date = "+date;
		try {
			Connection con = BDDConnect.connect();
			Statement stmt = con.createStatement();
	        ResultSet rs = stmt.executeQuery(sql);
	        return rs;
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
