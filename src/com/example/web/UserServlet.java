package com.example.web;

import java.io.IOException;
import java.sql.SQLException;
//import java.sql.*;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.UserDAO;
import com.example.model.User;

/**
 * Servlet implementation class UserServlet
 */

public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
       
    }
    public void init() {
    	userDAO = new UserDAO(); //å®£åUserDAOç©ä»¶
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
		try {
			switch(action) {
			case "/user/new":
				showNewForm(request, response);//顯示表單畫面
				break;
			case "/user/insert":
				insertUser(request, response);
				break;
			case "/user/edit":
				showEditForm(request, response);//顯示表單畫面
				break;
			case "/user/update":
				updateUser(request, response);//顯示表單畫面
				break;
			case "/user/delete":
                deleteUser(request, response);
                break;
			default:
				listUser(request, response);
				break;
			}
		}catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        response.setLocale(Locale.TAIWAN);
		doGet(request, response);
	}
	
	private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> listUser = userDAO.selectAllUser(); 
		int totalrows = listUser.size();
        request.setAttribute("totalrows", totalrows);
		request.setAttribute("listUser2", listUser); 
		RequestDispatcher dispatcher = request.getRequestDispatcher("../backend/users/list.jsp");
        dispatcher.forward(request, response); //跳轉頁面        
	}
	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("../backend/users/form.jsp");
        dispatcher.forward(request, response);
	}
	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = userDAO.selectUser(id);
		request.setAttribute("one_user", existingUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("../backend/users/form.jsp");
        dispatcher.forward(request, response);
	}
	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String name = request.getParameter("name1"); //取得input name欄位的資料
        String email = request.getParameter("email1"); //取得input email欄位的資料
        String created_at = request.getParameter("created_at"); //取得input created_at欄位資料
        User newUser = new User(name, email, created_at, null); //建立新的User資料(這裡呼叫的是User的建構子)
        userDAO.insertUser(newUser);
        response.sendRedirect("list"); //新增完跳回列表頁
	}
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id="+id);
        String name = request.getParameter("name1");
        String email = request.getParameter("email1");
        String updated_at = request.getParameter("updated_at");
        User editUser = new User(id, name, email, null, updated_at);
        userDAO.updateUser(editUser);
        response.sendRedirect("list");
        
	}
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO.deleteUser(id);
        response.sendRedirect("list");
	}
}
