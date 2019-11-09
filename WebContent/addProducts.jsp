<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>
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

String name=request.getParameter("name");
String categ=request.getParameter("categ");
String desc=request.getParameter("desc");
String unit=request.getParameter("unit");
String price=request.getParameter("price");
String supplier=request.getParameter("supplier");
String qty=request.getParameter("qty");
String date_del=request.getParameter("date_del");
String ex_date=request.getParameter("ex_date");
Part image=request.getPart("image");
InputStream is =image.getInputStream();

PreparedStatement ps=con.prepareStatement(""+
		"INSERT INTO `products`("+
			    "`product_name`,"+
			    "`category`,"+
			    "`description`,"+
			    "`unit`,"+
			    "`price`,"+
			    "`supplier`,"+
			    "`qty_left`,"+
			    "`date_delivered`,"+
			    "`expiration_date`"+
			    "`image`"+
			")"+
			"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"+
			"");

ps.setString(1,name);
ps.setString(2, categ);
ps.setString(3, desc);
ps.setString(4, unit);
ps.setString(5, price);
ps.setString(6, supplier);
ps.setString(7, qty);
ps.setString(8, date_del);
ps.setString(9, ex_date);
ps.setBlob(10, is);

int k=ps.executeUpdate();

RequestDispatcher rd=request.getRequestDispatcher("adminProducts.jsp");
if(k!=0){
	rd.include(request,response);
	out.println("<script type=\"text/javascript\">");
    out.println("confirm('Product Inserted Successfully');");
	out.println("</script>");
}
else{
	rd.include(request,response);
	out.println("<script type=\"text/javascript\">");
    out.println("confirm('Product Not Inserted');");
	out.println("</script>");
}

%>
</body>
</html>
<!--
	 CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `description` varchar(50) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `price` varchar(100) NOT NULL,
  `supplier` varchar(100) NOT NULL,
  `qty_left` int(10) NOT NULL,
  `date_delivered` varchar(20) NOT NULL,
  `expiration_date` varchar(20) NOT NULL,
  `image` MEDIUMBLOB,
   PRIMARY KEY(product_id)
);
    
    INSERT INTO `products`(
    `name`,
    `category`,
    `description`,
    `unit`,
    `price`,
    `supplier`,
    `quantity`,
    `date_del`,
    `ex_date`
)
VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);
    -->