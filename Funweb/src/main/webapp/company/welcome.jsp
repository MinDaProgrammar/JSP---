<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>company/welcome.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<style type="text/css">
	a{text-decoration: none;color: inherit;text-align: center;}
	b{color: navy;}
</style>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 들어가는곳 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 들어가는곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문 메인 이미지 -->
		<div id="sub_img"></div>
		<!-- 왼쪽 메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="#">Welcome</a></li>
				<li><a href="#">History</a></li>
				<li><a href="#">Newsroom</a></li>
				<li><a href="#">Public Policy</a></li>
			</ul>
		</nav>
		<!-- 본문 내용 -->
		<article>
			<h1>Welcome</h1>
			<figure class="ceo">
				<img src="../images/company/ceo.jpg">
				<figcaption>Fun Web CEO Minseok</figcaption>
			</figure>
			<p> 안녕하세요 최민석입니다. 웹 개발 공부 중입니다^^.</p>
			<h3>이 웹사이트에 구현되어 있는 목록들</h3>
			<ul>
				<li> 로그인</li>
				<li> 회원가입</li>
				<li> 게시판 
					<ul>
						<li>게시판 목록 및 페이징 처리</li>
						<li>게시판 1개 글 조회
							<ul>
								<li>게시판 글 수정</li>
								<li>게시판 글 삭제</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>
			
			<h3>앞으로 더 구현하고 싶은 목록들</h3>
			<ul>
			 <li>기타 악보 출력 (구체적인 기능↓) 
			 	<ul>
			 		<li> 기타 악보 게시판
			 			<ul>
			 				<li>인기 차트, 가수별, 장르별 필터링(옵션)</li>
			 				<li>댓글 및 좋아요, 조회수 기능(인기 차트 구현에 필요한 정보)(옵션)</li>
			 				<li>구독 기능 및 이메일 뉴스레터 기능(옵션) </li>
			 			</ul>
			 		</li>
			 		<li> 기타 코드 출력(아마도 이미지 파일 형식 or CSS 가져오기) </li>
			 		<li> 기타 카포에 따른 Transposing (아마 인덱스를 이용해서!?)</li>
			 		<li> 자동 스크롤 기능 악보 보기 수월
			 			<ul>
			 				<li>BPM으로 스크롤 속도 조절기능 </li>
			 				<li>가사 추가 + 노래방 기계처럼 지나갈 때 색깔 기능 </li>
			 			</ul>
			 		</li>
			 		<li> 악보 마지막 페이지에 연관된 악보 추천(같은 가수의 다른 곡 추천 등) </li>
			 		
			 	</ul>
			 </li>
			 <li><a href="TodoList/To-do-list.jsp"><b>To Do List</b></a>
			 	<ul>
			 		<li>입력 </li>
			 		<li>출력</li>
			 		<li>삭제</li>
			 		<li>(옵션)디테일 보여주기</li>
			 	</ul>
			 </li>
			</ul>
		</article>


		<div class="clear"></div>
		<!-- 푸터 들어가는곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터 들어가는곳 -->
	</div>
</body>
</html>


