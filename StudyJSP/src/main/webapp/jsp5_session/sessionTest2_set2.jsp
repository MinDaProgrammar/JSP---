<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest2_set2.jsp</h1>
	<% 
	String product_id=request.getParameter("product_id");
// 	out.print(product_id);
	session.setAttribute("cart_item", product_id);
	
	response.sendRedirect("sessionTest2_get2.jsp");
	%>
</body>
</html>