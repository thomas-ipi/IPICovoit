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

	private String connect ()
	{
		String response = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			response += "okClass ";
		}
		catch (Exception e){
			return e.getMessage();
		}
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://mysql-ipicoivoir.alwaysdata.net","153687","IPICovoit");
			//Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Tools\\SQLITE\\FILENAME","dbo719918772","@Zerty2018");
			response += "okay";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response += e.getMessage();
		}	
		return response;
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String con = connect();
		response.getWriter().append(con);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
 	}
}
