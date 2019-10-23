package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection{
	public static Connection con;
	String url="mysql:jdbc://localhost:3306/KiranaStore";
	String username="root";
	String password="";
	
	public DbConnection() throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection(url,username,password);
		} catch ( SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getCon() {
		return con;
	}
	
}
