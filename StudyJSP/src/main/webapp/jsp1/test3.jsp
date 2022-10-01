<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
String str1= "멤버(전역변수 입니다.)";

public void method1(){
	System.out.println("선언문 내의 method1() 메서드 호출됨!");
}

public String method2(){
	return "method2()의 리턴값";
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test3.jsp</h1>
	<h3>전역변수 str1 = <%=str1 %></h3>
	<h3>method2() 메서드 리턴값= <%=method2() %></h3>
	
<%-- 	<!-- <h3>로컬변수 str2= <%=str2 %></h3> --> --%>
	
	<%
	String str2="로컬(지역)변수입니다!";
	method1();
	
	
	out.println("<h3>이 문장은 웹브라우저에 출력됩니다.</h3>");
	System.out.println("이 문장은 이클립스 콘솔에 출력됩니다.");
// 	out.println(str2);

// 	public void method3(){
		
// 	}
	%>
	
	<h3>로컬변수 str2= <%=str2 %></h3>
	<h3>멤버변수 str3= <%=str3 %></h3>
	<%! String str3="멤버변수 str3입니다"; %>
	<h3>멤버변수 str3= <%=str3 %></h3>
	
	
</body>
</html>