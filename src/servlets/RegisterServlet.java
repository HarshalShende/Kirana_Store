package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/RegisterServlet")
@MultipartConfig(maxFileSize = 16177216)
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public RegisterServlet() {
       
    }
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String fname=req.getParameter("fname");
		String mname=req.getParameter("mname");
		String lname=req.getParameter("lname");
		String email=req.getParameter("email");
		String phono=req.getParameter("phono");
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String secquestion=req.getParameter("secquestion");
		String secanswer=req.getParameter("secanswer");
		String role=req.getParameter("role");
		Part image=req.getPart("image");
		InputStream is =image.getInputStream();
		
		
		PrintWriter out=res.getWriter();
		res.setContentType("text/html");
		
		//out.println(" "+fname+" "+mname+" "+lname+" "+email+" "+phono+" "+username+" "+password+" "+
		//				secquestion+" "+secanswer+" "+role);
		
		String connectionURL = "jdbc:mysql://localhost:3306/kiranastore";
		String user = "root";
		String pass = "";
		 
		Connection con = null;
		 
		try{
		    Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection(connectionURL, user, pass);
		    PreparedStatement pst=con.prepareStatement
		    		("insert into users(fname,mname,lname,email,phono,username,password,secquestion,secanswer,role,image)"
		    				+ "values(?,?,?,?,?,?,?,?,?,?,?)");
		    pst.setString(1, fname);
		    pst.setString(2, mname);
		    pst.setString(3, lname);
		    pst.setString(4, email);
		    pst.setString(5, phono);
		    pst.setString(6, username);
		    pst.setString(7, password);
		    pst.setString(8, secquestion);
		    pst.setString(9, secanswer);
		    pst.setString(10, role);
		    pst.setBlob(11, is);
		    
		    int k=pst.executeUpdate();
		    if(k==0) {
		    	out.println("<h1>Error In Insertion</h1>");
		    	
		    }else {
		    	out.println("<h1>User Registered Successfully</h1>");
		    }
		    
		}catch(SQLException e) {e.printStackTrace();} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}

//CREATE TABLE users(
//	    id INT(10) not null AUTO_INCREMENT,
//	    fname VARCHAR(20),mname VARCHAR(20),lname VARCHAR(20),
//	    email VARCHAR(50),
//	    phono VARCHAR(50),
//	    username VARCHAR(50),
//	    password VARCHAR(50),
//	    secquestion VARCHAR(255),
//	    secanswer VARCHAR(255),
//	    role VARCHAR(10),
//    	image MEDIUMBLOB,
//	    PRIMARY KEY(id)
//	);