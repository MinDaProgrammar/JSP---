<%@page import="ToDoList.todolistDTO"%>
<%@page import="ToDoList.todolistDAO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	todolistDAO dao = new todolistDAO();
	List list = dao.selectAll();
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../css/ToDoList.css" rel="stylesheet">
</head>
<body>
<div id="myDIV" class="header">
  <h2>My To Do List</h2>
  <form action="ToDoInsert.jsp">
  <input type="text" id="myInput" name="content" placeholder="추가할 목표...">
  <input type="submit" class="addBtn" value="추가">
  </form>
</div>
<% // 세션 아이디 없을 때 확인 후 전 페이지로 돌아가기 
if(session.getAttribute("sId")==null){
		%>
		<script>
		alert("로그인이 필요합니다!");
		history.back();
		</script>
		<%
	}
%>
<ul id="myUL">
<%
for(Object o : list){
	todolistDTO dto = (todolistDTO)o;
%>
	
	<li <%if(dto.isChecked()){%>class="checked"<%}else{} %> class="myDIV"> <a href="ToDoUpdate.jsp?idx=<%=dto.getIdx()%>"><%=dto.getContent() %></a> 
	</li>
	<li><button onclick="location.href='ToDoDeletePro.jsp?idx=<%=dto.getIdx()%>'">삭제</button> </li>

<%} %>
</ul>
<br>

<button onclick="location.href='../../main/main.jsp'">홈 화면으로 </button>

</body>
</html>