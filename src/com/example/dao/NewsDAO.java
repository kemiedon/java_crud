package com.example.dao;
import com.example.model.News;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

public class NewsDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/cake_data?serverTimezone=UTC&useSSL=false&characterEncoding=UTF-8";
    private String jdbcNewstitle = "admin";
    private String jdbcPass = "admin";
    private static final String INSERT_NEWS_SQL = "INSERT INTO news (published_at, title, content, created_at) VALUES " +
            " (?, ?, ?, ?);";

    private static final String SELECT_NEWS_BY_ID = "select * from news where id =?";
    private static final String SELECT_ALL_NEWS = "select * from news order by `created_at` desc";
    private static final String DELETE_NEWS_SQL = "delete from news where id = ?;";
    private static final String UPDATE_NEWS_SQL = "update news set published_at = ?, title = ?, content= ? , updated_at= ? where id = ?;";

    public NewsDAO(){}

    protected Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcNewstitle, jdbcPass);

        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }
    public void insertNews(News one_news) throws SQLException {
        System.out.println(INSERT_NEWS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEWS_SQL)) {
        	preparedStatement.setString(1, one_news.getPublished_at());
            preparedStatement.setString(2, one_news.getTitle());
            preparedStatement.setString(3, one_news.getContent());
            preparedStatement.setString(4, one_news.getCreated_at());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }
    public News selectNews(int id){
        News one_news = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NEWS_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rsNews = preparedStatement.executeQuery();
            while (rsNews.next()) {
            	String published_at = rsNews.getString("published_at");
                String title = rsNews.getString("title");
                String content = rsNews.getString("content");
                String created_at = rsNews.getString("created_at");
                String updated_at = rsNews.getString("updated_at");
                System.out.println(created_at);
                one_news = new News(id, published_at,  title, content,created_at,updated_at);

            }
        }catch(SQLException e){
            printSQLException(e);
        }
        return one_news;
    }
    public List< News > selectAllNewss(){
        List< News > news = new ArrayList<>();

        try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_NEWS);){
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String published_at = rs.getString("published_at");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String created_at = rs.getString("created_at");
                String updated_at = rs.getString("updated_at");
                news.add(new News(id, published_at, title, content, created_at,updated_at));
            }

        }catch(SQLException e){
            printSQLException(e);
        }
        return news;
    }
    public boolean deleteNews(int id) throws SQLException{
        boolean rowDeleted;
        try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_NEWS_SQL);){
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean updateNews(News one_news) throws SQLException{
        boolean rowUpdated;
        try( Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_NEWS_SQL);){
            statement.setString(1, one_news.getPublished_at());
            statement.setString(2, one_news.getTitle());
            statement.setString(3, one_news.getContent());
            statement.setString(4, one_news.getUpdated_at());
            statement.setInt(5, one_news.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
        private void printSQLException(SQLException ex) {
            for (Throwable e: ex) {
                if (e instanceof SQLException) {
                    e.printStackTrace(System.err);
                    System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                    System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                    System.err.println("Message: " + e.getMessage());
                    Throwable t = ex.getCause();
                    while (t != null) {
                        System.out.println("Cause: " + t);
                        t = t.getCause();
                    }
                }
            }
        }
}
