package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DbConnection;

public class AdminLoginServlet extends HttpServlet{
	
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
//		String connectionURL = "jdbc:mysql://localhost:3306/kiranastore";
//		String user = "root";
//		String pass = "";
		
		//Get The Attributes Form The Html Form
		String aname=req.getParameter("aname");
		String apass=req.getParameter("apass");
		PrintWriter pw=res.getWriter();
		res.setContentType("text/html");
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			con=DriverManager.getConnection(connectionURL,user,pass);
			Connection con=DbConnection.getCon();
			PreparedStatement ps=con.prepareStatement("select * from users where username='?' and password='?'");
			ps.setString(1, aname);
			ps.setString(2, apass);
			ResultSet rs=ps.executeQuery();
			
			pw.println(rs.getString("fname")+" "+rs.getString("mname")+rs.getString("lname"));
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
}
