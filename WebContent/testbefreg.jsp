<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Collapsible sidebar using Bootstrap 4</title>
        <!-- Bootstrap CSS CDN -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <!-- Our Custom CSS -->
        <link rel="stylesheet" href="style4.css">
        <!-- Font Awesome JS -->
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
</head>
<body>
<%
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
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		RequestDispatcher rd=request.getRequestDispatcher("login.html");
		rd.include(request, response);
		pw.println("<script type=\"text/javascript\">");
	    pw.println("alert('Only One Admin Can Be There .Already One Admin Is There');");
		pw.println("</script>");
		}
	else {
		RequestDispatcher rd=request.getRequestDispatcher("newRegistration.html");
		rd.forward(request, response);
	}
}catch(SQLException | ClassNotFoundException e) {e.printStackTrace();}

%>
</body>
</html>