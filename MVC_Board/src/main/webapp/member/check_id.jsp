<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	//아이디 검색후 리다이렉트 후 검색 결과 작업 수행
	window.onload = function() {
		var id = "<%=request.getParameter("id")%>";
		var checkResult = document.getElementById("checkIdResult");
		if(id!="null"){
			var isDuplicate = "<%=request.getParameter("isDuplicate")%>";
			document.fr.id.value = id;
			if(isDuplicate == "true"){
				checkResult.innerHTML="아이디 중복! 사용불가!";
				checkResult.style.color= "red";
			}else{
				checkResult.innerHTML="아이디 사용 가능^^<br>" + "<input type='button' value='아이디 사용' onclick='useId()'>";
				checkResult.style.color= "green";
			}
		}		
	}
	
	function checkId(){
		//정규 표현식 
		var id = document.fr.id.value;
		
		var elemSpan = document.getElementById("checkIdResult"); 
		var regex = /^[A-Za-z][a-zA-Z0-9]{3,15}$/;
// 		if(regex.exec(id)){
// 			elemSpan.innerHTML = "사용 가능한 아이디";
// 			elemSpan.style.color = "blue";
// 		}else{
// 			elemSpan.innerHTML = "영문 대소문자, 숫자, 특수문자 조합 4~16자리 필수!";
// 			elemSpan.style.color = "RED";
// 			document.fr.id.select();
// 			return false;
// 		}
		
		 if(!regex.exec(id)){
			 elemSpan.innerHTML = "영문 대소문자, 숫자, 특수문자 조합 4~16자리 필수!";
			 elemSpan.style.color = "RED";
   			 document.fr.id.select();
			 return false;
		 }else{
			 return true;
		 }
	}
	
	function useId(){
		window.opener.document.fr.id.value=document.fr.id.value;
		window.close();
	}
	
</script>
</head>
<body>
	<h1>ID 중복 체크</h1>
	<form action="CheckDuplicateId.me" name="fr" onsubmit="return checkId()" >
		<input type="text" name="id">
		<input type="submit" value="중복확인">
		<div id="checkIdResult">
		
		</div>
	</form>
</body>
</html>