<%@page import="jsp9_jdbc.Test8_1DTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jsp9_jdbc.Test8_1DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//selectList2를 통해서 test8_1의 전체 목록 조회 (SELECT*FROM) 및 
	//웹 브라우저에서의 출력
	
	//데이터 조회에 필요한 접근 객체 생성
	Test8_1DAO dao = new Test8_1DAO();
	
	//각 행을 dto에 저장하고 그 dto들을 저장한 arrayList를 반환하는 selectList2메서드를 생성 및 호출
	//그 값을 새로운 arrayList (list)에 저장 후 HTML에 출력
	ArrayList list = dao.selectList2();
	
	//나중에 arrayList에서 dto를 꺼내기 위한 dto 생성
	Test8_1DTO dto = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복습용</title>
</head>
<body>
	<h1>test4_selectList2_Review.jsp</h1>
	
	<!-- 출력을 아름답게 하기위한 테이블 생성^^ -->
	<table border="1">
	<tr>
		<th>이름</th>
		<th>나이</th>
		<th>성별</th>
		<th>취미</th>
	</tr>
	<%
	//for문을 사용하여 각 인덱스에 저장된 dto에 접근
	//arrayList의 경우 객체이기에 .size 를 사용하여 크기를 받아옴
	for(int i=0;i<list.size();i++){
		dto = (Test8_1DTO)list.get(i); //arrayList.get()메서드의 리턴타입이 Object이기에 dto로 형변환 필요 
	%>
		<!-- dto에 저장된 값을 get을 통해 접근 후 웹 브라우저에 출력 -->
		<tr>
		<td><%=dto.getName()%> </td>
		<td><%=dto.getAge() %> </td>
		<td><%=dto.getGender() %> </td>
		<td><%=dto.getHobby() %> </td>
		</tr>
	<%} %>
	</table>
</body>
</html>