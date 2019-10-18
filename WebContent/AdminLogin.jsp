<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<body>
<%

String connectionURL = "jdbc:mysql://localhost:3306/kiranastore";
String user = "root";
String pass = "";
Connection con;
//Get The Attributes Form The Html Form
String aname=request.getParameter("aname");
String apass=request.getParameter("apass");
try {
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection(connectionURL,user,pass);
	PreparedStatement ps=con.prepareStatement("select * from users where username=? and password=?");
	ps.setString(1, aname);
	ps.setString(2, apass);
	ResultSet rs=ps.executeQuery();
	PrintWriter pw=response.getWriter();
	response.setContentType("text/html");
	if(rs.next()){
		response.sendRedirect("AdminPanelHome.html");
	}
	else{
		RequestDispatcher rd=request.getRequestDispatcher("login.html");
		rd.include(request,response);
		pw.println("<script type=\"text/javascript\">");
	    pw.println("alert('Username Or Password Is Wrong');");
		pw.println("</script>");
		
	}
	con.close();
%>
<%
}catch(SQLException | ClassNotFoundException e) {
	e.printStackTrace();
}

%>

</body>
</html>
