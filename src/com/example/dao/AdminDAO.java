package com.example.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.model.Admin;

public class AdminDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/cake_data?serverTimezone=UTC&useSSL=false&characterEncoding=UTF-8";
    private String jdbcusername = "admin";
    private String jdbcPass = "admin";
  
    private static final String SELECT_ADMIN = "select * from admins where email =? and password=?";
  
    public AdminDAO(){}

    protected Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcusername, jdbcPass);

        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return connection;
    }
    public Admin checkAdmin(String email, String password) throws ClassNotFoundException{
    	Admin admin = null;
    	try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN);) {
    		preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rsAdmin = preparedStatement.executeQuery();
            while (rsAdmin.next()) {
            	String name = rsAdmin.getString("name");
                String email2 = rsAdmin.getString("email");
                String password2 = rsAdmin.getString("password");
                admin = new Admin(name, email2, password2);
            }
    	}catch(SQLException e){
            e.printStackTrace();
        }
        return admin;
    }
}
