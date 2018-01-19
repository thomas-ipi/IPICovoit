package com.tbdc.servlet;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tbdc.model.User;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/users")
public class UserManagerAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// View
    public static String VIEW_PAGES_URL="/WEB-INF/users.jsp";
    
    // Form fields
    public static final String FIELD_EMAIL = "email";
    public static final String FIELD_PWD = "pwd";
    
    // Request attributs
    Map<String, String> error;// = new HashMap<String, String>();
    Map<String, String> form;// = new HashMap<String, String>();
    String statusMessage="";
    boolean statusOk=false;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagerAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String,User> users = (HashMap<String, User>)session.getAttribute( "users" );
        request.setAttribute("users", users);
		this.getServletContext().getRequestDispatcher(VIEW_PAGES_URL).forward( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
	}
}

