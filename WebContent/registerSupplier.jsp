<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"  %>
<%@ page import="java.io.*"  %>
<%@ page import="java.io.PrintWriter"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
PrintWriter pw=response.getWriter(); 
response.setContentType("text/html");

String connectionURL = "jdbc:mysql://localhost:3306/kiranastore";
String user = "root";
String pass = "";

String name=request.getParameter("name");
String contact=request.getParameter("contact");
String address=request.getParameter("address");
Part image=request.getPart("image");
InputStream is =image.getInputStream();

if(name==null || contact==null ||address==null){
	RequestDispatcher rd1=request.getRequestDispatcher("adminSupplier.jsp");
	rd1.include(request,response);
	pw.println("<script type=\"text/javascript\">");
    pw.println("alert('Some Fields Are Empty');");
	pw.println("</script>");
}
else{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=(Connection)DriverManager.getConnection(connectionURL, user, pass);
		PreparedStatement pst=(PreparedStatement) con.prepareStatement
	    		("insert into suppliers(name,contact,address,image)"
	    				+ "values(?,?,?,?)");
	    pst.setString(1, name);
	    pst.setString(2, contact);
	    pst.setString(3, address);
	    pst.setBlob(4, is);
	   
	    int k=pst.executeUpdate();
	    

    if(k==0) {
    	
    	pw.println("<script type=\"text/javascript\">");
	    pw.println("alert('Suppier Registration Failed');");
		pw.println("</script>");
		response.sendRedirect("adminSupplier.jsp");
    	
    }else {
    	
    	pw.println("<script type=\"text/javascript\">");
	    pw.println("alert('Suppier Registration Failed');");
		pw.println("</script>");
		response.sendRedirect("adminSupplier.jsp");
    }
}

catch(Exception e){ e.printStackTrace(); }

}

%>
</body>
</html>