<%@page import="jsp10_board.BoardDTO"%>
<%@page import="jsp10_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>
<style>
#modifyForm{
		width: 500px;
		height: 450px;
		border: 1px solid red;
		margin: auto;
	}
	
	h1{
		text-align: center;
	}
	
	table{
		margin:auto;
		width:450px;
	}
	
	.td_left{
		width: 150px;
		text-align: center;
		background: orange;
	}
	
	.td_right{
		width: 300px;
		background: skyblue;
	}
	
	#commandCell{
		text-align: center;
	}
</style>
</head>
<body>
<%
	if(session.getAttribute("sId")==null){	//세션에 값이 없으면, 즉 로그인이 안되어 있다면 자바 스크립트 사용하여 로그인 필수 출력 후 로그인 페이지로 이동
		%>
		<script>
		alert("로그인 필수!");
		location.href="../member/login_form.jsp";
		</script>
		<%
	}

	BoardDAO dao = new BoardDAO();
	BoardDTO dto = new BoardDTO();
	
	dto = dao.selectDetail(idx); //dto를 리턴받아 수정할 값들을 출력
	if(dto==null){
		%>
		<script>
			alert("잘못된 요청!");
			history.back();
		</script>
		<%
	}
%>
		<h1>글 상세내용</h1>

	<section id="modifyForm">
		<h1>글쓰기</h1>
		<form action="modifyPro.jsp" method="post"> <!-- 입력 받은 정보를 writePro.jsp에 포스트 방식으로 입력 -->
		<!-- 수정에 필요한 글번호를 post방식으로 전송 -->
			<input type="hidden" name="idx" value="<%=idx %>">
			<table>	<!-- 각 행에 필요한 정보를 입력하는 칸을 생성 -->
				<tr>
					<td class="td_left"><label for="name">작성자</label></td>
					<td class="td_right"><input type="text" name="name" readonly="readonly" value=<%=dto.getName() %>></td>
				</tr>
				<tr>
					<td class="td_left"><label for="passwd">비밀번호</label></td>
					<td class="td_right"><input type="password" name="passwd" required="required"></td>
				</tr>
				<tr>
					<td class="td_left"><label for="subject">제목</label></td>
					<td class="td_right"><input type="text" name="subject" value="<%=dto.getSubject()%>" required="required" ></td>
				</tr>
				<tr>
					<td class="td_left"><label for="content">내용</label></td>
					<td class="td_right">
						<textarea rows="15" cols="40" required="required" name="content"><%=dto.getContent() %></textarea>
					</td>
				</tr>
			</table>
			
			<section id="commandCell">
				<input type="submit" value="수정">	<!-- 등록 버튼을 눌러 writePro.jsp로 데이터 전송 -->
				<input type="reset" value="초기화"> <!-- 다시쓰기로 입력된 값 초기화 -->
				<input type="button" value="돌아가기" onclick="history.back()"> <!-- 이전 페이지로 돌아가기 -->
			</section>
		</form>
	</section>
</body>
</html>