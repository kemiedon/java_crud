package com.example.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.example.model.User;


public class UserDAO {
	private String jdbcURL = "jdbc:mysql://localhost:3306/cake_data?serverTimezone=UTC&useSSL=false&characterEncoding=UTF-8"; //資料庫連線
    private String jdbcUsername = "admin"; //資料庫帳號
    private String jdbcPass = "admin"; //資料庫密碼
    private static final String INSERT_USER="INSERT INTO users (name, email, created_at) VALUES (?,?,?);"; //新增的sql語法
    private static final String SELECT_ALL_USERS = "select * from users order by `created_at` desc"; //查詢所有資料的sql語法
    private static final String SELECT_USER = "select * from users where id=?"; //查詢指定資料的sql語法
    private static final String UPDATE_USERS_SQL = "update users set name = ?, email= ? , updated_at=? where id = ?;";

    public UserDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected Connection getConnection() { //資料庫連線函式
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPass);
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
        return connection;
	}
	public List <User> selectAllUser(){ //取得所有user資料函式
		List < User > users = new ArrayList<>(); //宣告一個list物件(存放user所有資料)
		//執行連結與取得資料
		try(Connection connection= getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_ALL_USERS);){
			System.out.println(statement);
			ResultSet rs = statement.executeQuery(); //執行指定的sql語法
			//跑迴圈取得資料庫的所有資料
			while(rs.next()){
                int user_id = rs.getInt("id"); 
                String user_name = rs.getString("name");
                String user_email = rs.getString("email");
                String created_at = rs.getString("created_at");
                String updated_at = rs.getString("updated_at");
                users.add(new User(user_id, user_name, user_email,created_at,updated_at)); //å°è³æå­å¥userséåArrayList
            }
			
		}catch(SQLException e) { //例外處理
			e.printStackTrace();
		}
		return users;
	}
	public void insertUser(User user) throws SQLException {
		try(Connection connection= getConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_USER);){
			statement.setString(1, user.getName()); //對應欄位取得User model中的name
			statement.setString(2, user.getEmail());//對應欄位取得User model中的email
			statement.setString(3, user.getCreated_at());
			statement.executeUpdate(); //執行insert的sql語法
		}catch (SQLException e) {
            e.printStackTrace();
        }
	}
	public User selectUser(int id){
		User user = null;
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER);) {
			preparedStatement.setInt(1, id);
			ResultSet rsUser = preparedStatement.executeQuery();
			while (rsUser.next()) {
                String name = rsUser.getString("name");
                String email = rsUser.getString("email");
                String created_at = rsUser.getString("created_at");
                String updated_at = rsUser.getString("updated_at");
                System.out.println(created_at);
                user = new User(id, name, email,created_at,updated_at);

            }
		}catch(SQLException e){
            e.printStackTrace();
        }
		return user;
	}
	public void updateUser(User user) throws SQLException {
		try(Connection connection= getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);){
			statement.setString(1, user.getName()); //對應欄位取得User model中的name
			statement.setString(2, user.getEmail());//對應欄位取得User model中的email
			statement.setString(3, user.getUpdated_at());
			statement.setInt(4, user.getId());
			statement.executeUpdate(); //執行update的sql語法
		}catch (SQLException e) {
            e.printStackTrace();
        }
	}
}
