package com.example.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.News;

import com.example.dao.NewsDAO;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

@MultipartConfig
public class NewsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private NewsDAO newsDAO;

    public void init(){
        newsDAO = new NewsDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setLocale(Locale.TAIWAN);
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setLocale(Locale.TAIWAN);
        response.getWriter().append("Served at: ").append(request.getContextPath());
        String action = request.getServletPath();
        try{
            switch(action){
                case "/news/new":
                    showNewForm(request, response);
                    break;
                case "/news/insert":
                    insertNews(request, response);
                    break;
                case "/news/delete":
                    deleteNews(request, response);
                    break;
                case "/news/edit":
                    showEditForm(request, response);
                    break;
                case "/news/update":
                    updateNews(request, response);
                    break;
                case "/news-list":
                	listNews(request, response, "frontend");
                case "/news-page":
                    getOneNews(request, response);
                    break;
                default:
                	listNews(request, response, "backend");
                    break;
                
                
            }
        }catch (SQLException e){
            throw new ServletException(e);
        }
    }
    
    private void listNews(HttpServletRequest request, HttpServletResponse response, String type) throws SQLException, IOException, ServletException{
    	RequestDispatcher dispatcher;
    	List < News > listNews = newsDAO.selectAllNewss();
        request.setAttribute("listNews", listNews);
        if(type == "backend") {
        	dispatcher = request.getRequestDispatcher("../backend/news/list.jsp");
        }else {
        	dispatcher = request.getRequestDispatcher("news-list.jsp");
        }
        
        dispatcher.forward(request, response);
        
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        RequestDispatcher dispatcher = request.getRequestDispatcher("../backend/news/form.jsp");
        dispatcher.forward(request, response);
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException{
        int id = Integer.parseInt(request.getParameter("id"));
        News existingNews = newsDAO.selectNews(id);
        request.setAttribute("news", existingNews);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../backend/news/form.jsp");
        
        dispatcher.forward(request, response);

    }
    private void getOneNews(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException{
        int id = Integer.parseInt(request.getParameter("id"));
        News existingNews = newsDAO.selectNews(id);
        request.setAttribute("one_news", existingNews);
        RequestDispatcher dispatcher = request.getRequestDispatcher("news.jsp");
        dispatcher.forward(request, response);

    }
    private void insertNews(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
    	String published_at = request.getParameter("published_at");
    	String title = request.getParameter("title");
        String content = request.getParameter("content");
        String created_at = request.getParameter("date");
        System.out.println("published"+published_at);
        String updated_at = "null";
        News newNews = new News(published_at, title, content, created_at, updated_at);
        newsDAO.insertNews(newNews);
        response.sendRedirect("list");

    }
    
    private void updateNews (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException{
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("id="+id);
        String published_at = request.getParameter("published_at");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String created_at = "null";
        String updated_at = request.getParameter("date");
        News book = new News(id, published_at, title, content, created_at, updated_at);
        newsDAO.updateNews(book);
        response.sendRedirect("list");

    }
    private void deleteNews(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        newsDAO.deleteNews(id);
        response.sendRedirect("list");

    }
}
