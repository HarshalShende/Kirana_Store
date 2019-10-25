<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="dao.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

String category=request.getParameter("category");
Connection con = DbConnection.getCon();
PreparedStatement ps=con.prepareStatement("insert into category(category) values('?')");
ps.setString(1, category);
int k=ps.executeUpdate();
if(k!=0){
	PrintWriter pw=response.getWriter();
	RequestDispatcher rd=request.getRequestDispatcher("adminProducts.jsp");
	rd.include(request,response);
	pw.println("<script type=\"text/javascript\">");
    pw.println("alert('Category Added');");
	pw.println("</script>");
}
else{
	PrintWriter pw=response.getWriter();
	RequestDispatcher rd=request.getRequestDispatcher("adminProducts.jsp");
	rd.include(request,response);
	pw.println("<script type=\"text/javascript\">");
    pw.println("alert('Category Not Added');");
	pw.println("</script>");
}
%>

</body>
</html>