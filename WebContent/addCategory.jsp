<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String connectionURL = "jdbc:mysql://localhost:3306/kiranastore";
String user = "root";
String pass = "";
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection(connectionURL, user, pass);

String category=request.getParameter("category");
PreparedStatement ps=con.prepareStatement("insert into categories(category) values(?)");
ps.setString(1, category);
int k=ps.executeUpdate();
if(k!=0){
	response.sendRedirect("adminSupplier.jsp");
	out.println("<script type=\"text/javascript\">");
    out.println("confirm('Category Added');");
	out.println("</script>");
}
else{
	response.sendRedirect("adminSupplier.jsp");
	out.println("<script type=\"text/javascript\">");
    out.println("confirm('Category Not Added');");
	out.println("</script>");
}
%>

</body>
</html>