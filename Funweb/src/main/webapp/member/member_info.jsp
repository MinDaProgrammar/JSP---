<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO dto = new MemberDTO();
	MemberDAO dao = new MemberDAO();
	
	dto = dao.select(request.getParameter("id")); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet">
<link href="../css/subpage.css" rel="stylesheet">
</head>
<body>
<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 들어가는곳 -->
		  
		<!-- 본문들어가는 곳 -->
		  <!-- 본문 메인 이미지 -->
		  <div id="sub_img_member"></div>
		  <!-- 왼쪽 메뉴 -->
		  <nav id="sub_menu">
		  	<ul>
		  		<li><a href="#">Join us</a></li>
		  		<li><a href="#">Privacy policy</a></li>
		  	</ul>
		  </nav>
		  <!-- 본문 내용 -->
		  <article>
		  	<h1>Join Us</h1>
		  	<form action="joinPro.jsp" method="post" id="join" name="fr">
		  		<fieldset>
		  			<legend>Basic Info</legend>
		  			<label>User Id</label>
		  			<input type="text" name="id" class="id" id="id" required="required" readonly="readonly" value="<%=dto.getId() %>">
		  			<input type="button" value="dup. check" class="dup" id="btn" onclick="openDupCheckWindow()"><br>
		  			
		  			<label>Password</label>
		  			<input type="password" name="pass" id="pass" required="required" value="<%=dto.getPass()%>"><br> 			
		  			
		  			<label>Retype Password</label>
		  			<input type="password" name="pass2" onblur="checkPass(this.value)">
		  			<span id="checkPassResult"><!-- 패스워드 확인 결과 출력 위치 --></span><br>
		  			
		  			<label>Name</label>
		  			<input type="text" name="name" id="name" required="required" value="<%=dto.getName() %>"><br>
		  			
		  			<label>E-Mail</label>
		  			<input type="email" name="email" id="email" required="required" value="<%=dto.getEmail() %>"><br>
		  			
		  			<label>Retype E-Mail</label>
		  			<input type="email" name="email2" onblur="checkEmail(this.value)">
		  			<span id="checkEmailResult"><!-- 이메일 확인 결과 출력 위치 --></span><br>
		  		</fieldset>
		  		
		  		<fieldset>
		  			<legend>Optional</legend>
		  			<label>Address</label>
		  			<input type="text" name="address" value="<%=dto.getAddress() %>"><br>
		  			<label>Phone Number</label>
		  			<input type="text" name="phone" value="<%=dto.getPhone() %>"><br>
		  			<label>Mobile Phone Number</label>
		  			<input type="text" name="mobile" value="<%=dto.getMobile() %>"><br>
		  		</fieldset>
		  		<div class="clear"></div>
		  		<div id="buttons">
		  			<input type="submit" value="Submit" class="submit">
		  			<input type="reset" value="Cancel" class="cancel">
		  		</div>
		  	</form>
		  </article>
		  
		  
		<div class="clear"></div>  
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>