package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

import com.mysql.jdbc.Connection;
@SuppressWarnings("serial")
public class TestBeforeResisterAdmin extends GenericServlet{
@Override
public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
	// TODO Auto-generated method stub

	String connectionURL = "jdbc:mysql://localhost:3306/kiranastore";
	String user = "root";
	String pass = "";
	 
	Connection con = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con=(Connection) DriverManager.getConnection(connectionURL, user, pass);
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from users where role='admin'");
		if(rs.next()) {
			res.setContentType("text/html");
			PrintWriter pw=res.getWriter();
			RequestDispatcher rd=req.getRequestDispatcher("login.html");
			rd.include(req, res);
			pw.println("<script type=\"text/javascript\">");
		    pw.println("alert('Only One Admin Can Be There .Already One Admin Is There');");
			pw.println("</script>");
		}
		else {
			RequestDispatcher rd=req.getRequestDispatcher("newRegistration.html");
			rd.forward(req, res);
		}
	}catch(SQLException | ClassNotFoundException e) {e.printStackTrace();}
}
}
