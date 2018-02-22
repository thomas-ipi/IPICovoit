package com.IPICovoit;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/isConnect")
public class BDDConnect extends HttpServlet {

	public static Connection connect ()
	{
		String response = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			response += "okClass ";
		}
		catch (Exception e){
			 e.printStackTrace();
			 return null;
		}
		try {
			return DriverManager.getConnection("jdbc:mysql://mysql-ipicoivoir.alwaysdata.net","153687","IPICovoit");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = connect();
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
 	}
}
