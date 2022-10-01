<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<script>

	function checkPassword(){
// 		alert("onchange!");
		let pw = document.fr.passwd;
		let pwcheck = document.fr.passwd2;
		let result = document.getElementById('checkPass');
		
		if(pw.value==pwcheck.value){
			result.innerHTML="비밀번호 일치!";
			result.style.color="#55AA33";
		}else{
			result.innerHTML="비밀번호 불일치!";
			result.style.color="#992222";
		}
	}
	
	
	function clickAll(selectAll){
// 		const checkboxes = document.querySelectorAll('input[type="checkbox"]');
  
//   checkboxes.forEach((checkbox) => {
//     checkbox.checked = selectAll.checked
//   })

		for (let i of document.fr.hobby){
			if(document.fr.hobby_all.checked){
				i.checked=true;
			}else
				i.checked=false;
		}
			
	}
	
	function itemSelect(){
		for(let i of document.fr.emailDomain.options){
			if(i.selected){
// 				alert(document.fr.email2.value);
				document.fr.email2.value=i.value;
// 				alert(document.getElementsByName('email2').value);
			}
		}
	}
	
	function checkIdLength(){
		if(document.fr.id.value.length>8 || document.fr.id.value.length<4){
			alert("아이디는 4~8자리 필수!");
			document.fr.id.focus();
		}
	}
	
	function winOpen(){
		window.open("check_id.jsp","ID중복확인","width=400, height=200");
	}
	
	function checkPassLength(){
		if(document.fr.passwd.value.length<8 || document.fr.passwd.value.length>16){
			alert("패스워드는 8~16자리 필수!");
			document.fr.passwd.focus();
		}
	}
	
	function goNext1(){
		if(document.fr.jumin1.value.length>5){
			document.fr.jumin2.focus();
		}
	}
	
	function goNext2(){
		if(document.fr.jumin2.value.length>6){
			document.fr.email1.focus();
		}
	}
	
	function checksub(){
// 		모든 부분 입력 및 선택 되었는지 입력		
		if(document.fr.name.value==""){
			alert("이름 입력이 안되어 있습니다.")
			document.fr.name.focus();
			return false;
		}else if(document.fr.id.value==""){
			alert("아이디 입력를 입력해 주세요.")
			document.fr.id.focus();
			return false;
		}else if(document.fr.passwd.value==""){
			alert("패스워드를 입력해 주세요.")
			document.fr.passwd.focus();
			return false;
		}else if(document.fr.passwd2.value==""){
			alert("패스워드 재확인 해주세요.")
			document.fr.passwd2.focus();
			return false;
		}else if(document.fr.jumin1.value==""){
			alert("주민번호 앞자리를 입력해 주세요.")
			document.fr.jumin1.focus();
			return false;
		}else if(document.fr.jumin2.value==""){
			alert("주민번호 뒷자리를 입력해 주세요.")
			document.fr.jumin2.focus();
			return false;
		}else if(document.fr.email1==""){
			alert("이메일을 입력해주세요.");
			return false;
		}else if(document.fr.email2==""){
			alert("이메일을 입력해주세요");
			return false;
		}else if(document.fr.job.options[0].selected){
			alert("직업을 선택하세요.")
			document.fr.job.focus();
			return false;
		}else if(!document.fr.gender[0].checked && !document.fr.gender[1].checked){
			alert("성별을 선택하세요.");
			document.fr.gender[0].focus();
			return false;
		}
		if(!document.fr.hobby[0].checked && !document.fr.hobby[1].checked && 
				!document.fr.hobby[2].checked){
			alert("취미를 선택하세요!");
			document.fr.hobby[0].focus();
			return false;
		}
	}
	
	
</script>
</head>
<body>
	<!-- id 중복확인 버튼 클릭 시 새 창 띄우기(check_id.jsp 파일 열기)  -->
	<form action="insertPro2.jsp" method="post" name="fr" onsubmit="return checksub()">
		<h1>회원상세정보</h1>
		<table border="1">
			<tr>
				<td><input type="text" value="이름" readonly="readonly"></td>
				<td><input type="text" name="name"></td>
			</tr>
										<!--  아이디 -->			
			<tr>
				<td><input type="text" value="ID" readonly="readonly">
				<td><input type="text" name="id" placeholder="4~8글자 사이 입력">
				<input type="button" value="ID중복확인" onclick="winOpen()"></td>
			</tr>
										<!--  비밀번호 -->
			<tr>
				<td><input type="text" value="비밀번호"  readonly="readonly"></td>
				<td><input type="password" placeholder="8~16글자 사이 입력" name="passwd"></td>
			</tr>
			
			<tr>
				<td><input type="text" value="비밀번호확인"  readonly="readonly"></td>
				<td><input type="password" name="passwd2" onkeyup="checkPassword()">
				<span id="checkPass"></span>
				</td>
			</tr>
			
										<!--  주민번호 -->
			<tr>
				<td><input type="text" value="주민번호" readonly="readonly"></td>
				<td><input type="text" maxlength="6" name="jumin1" onkeyup="goNext1()"> -
				<input type="password" maxlength="7" name="jumin2" onkeyup="goNext2()"></td>	
			</tr>
			
										<!--  이메일 -->
			<tr>
				<td><input type="text" value="E-Mail" readonly="readonly"></td>
				<td><input type="text" name="email1">@
				<input type="text" name="email2">
				<select name="emailDomain" onchange="itemSelect()">
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option disabled="disabled">daum.net</option>
					<option value="google.com">google.com</option>
					<option value="nate.com">nate.com</option>
				</select>
				</td>
			</tr>
			
										<!--  직업 선택 -->
			<tr>
				<td><input type="text" value="직업" readonly="readonly"></td>
				<td><select name="job">
					<option>항목을 선택하세요</option>
					<option>프로그래머</option>
					<option>학생</option>
					<option disabled="disabled">건물주</option>
					<option>주부</option>
				</select>
				</td>
			</tr>
			
										<!--  성별 선택 -->			
			<tr>
				<td><input type="text" value="성별" readonly="readonly"></td>
				<td><input type="radio" name="gender" value="남">남
				<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			
										<!--  취미 선택 -->			
			<tr>
				<td><input type="text" value="취미" readonly="readonly"></td>
				<td>
				<input type="checkbox" id="여행" name="hobby" value="여행"><label for="여행">여행</label>
				<input type="checkbox"  id="독서" name="hobby" value="독서"><label for="독서">독서</label>
				<input type="checkbox"  id="게임" name="hobby" value="게임"><label for="게임">게임</label>
				<input type="checkbox" id="all" name="hobby_all" onclick="clickAll(this)"><label for="all">전체선택</label>
				</td>	
			</tr>
			
										<!--  가입동기 -->			
			<tr>
				<td><input type="text" value="가입동기" readonly="readonly"></td>
				<td><textarea cols="40" rows="15" name="content"
				placeholder="웹 개발자가 되고 싶어서 가입했습니다!"></textarea></td>
			</tr>
				
			<tr>
				<td colspan="2"><input type="submit" value="가입">
				<input type="reset" value="초기화">
				<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>