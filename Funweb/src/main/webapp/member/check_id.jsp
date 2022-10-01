<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
// out.println(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function printId(){
		window.opener.document.fr.id.value = "<%=id%>";
		window.close();
	}
</script>
</head>
<body>
	<h1>ID 중복확인</h1>
	<form action="check_id_pro.jsp" method="get">
		<script>
			document.getElementById("id2").value = window.opener.document.getElementById("id").value;
		</script>
		<input type="text" name="id" id="id2" <%if(id!=null){%> value="<%=id%>"<%}%>>
		<input type="submit" value="중복확인">
	</form>
	<span id="checkResult"></span>
	<%
	if (id != null) {

		boolean overlap = Boolean.parseBoolean(request.getParameter("overlap"));

		if (overlap) {
		%>
		<h3 style="color: red"><%=id %>는 사용 불가능</h3>
		<%} else {%>
		<h3 style="color: green"><%=id %> 아이디는 사용 가능한 아이디 입니다.</h3>
		<input type="button" value="아이디 사용" onclick="printId()">
		<%}%>

	<%}%>
</body>
</html>