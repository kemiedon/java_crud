package com.example.web;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.dao.AdminDAO;

import com.example.model.Admin;

/**
 * Servlet implementation class AdminServlet
 */

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO;   
    private HttpSession session;
    private RequestDispatcher dispatcher;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public void init(){
    	adminDAO = new AdminDAO();
    }
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        response.setLocale(Locale.TAIWAN);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getServletPath();	
			switch(action) {
				case "/login":
					dispatcher = request.getRequestDispatcher("/backend/login.jsp");
			        dispatcher.forward(request, response);
					break;
				case "/logout":
					session.invalidate();					
					dispatcher = request.getRequestDispatcher("/backend/login.jsp");
			        dispatcher.forward(request, response);
					break;
			}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try {
        	Admin admin = adminDAO.checkAdmin(email, password);
			if(admin != null) {
				//如果帳號密碼相符，就執行跳轉到user/list
				session = request.getSession();
				session.setAttribute("admin", admin.getName());
				System.out.println("admin_name="+ admin.getName());
				response.sendRedirect("backend/users/list.jsp");
			}else {
				response.sendRedirect("login?error=true");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
