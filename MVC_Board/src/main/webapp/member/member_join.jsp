<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
	h1{
		text-align: center;
	}
	body{
		background-color: beige;
	}
	#listForm {
		width: 1024px;
		max-height: 610px;
		margin: auto;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		margin: auto;
		width: 1024px;
	}
	
	#tr_top {
		background: #f95;
		text-align: center;
	}
	
	table{
		background-color: #fa5;
	}
	table td {
		text-align: left;
		margin-right: 0;
		padding: 0;
	}
	tr:nth-of-type(2n){
		background-color: #da3;
	}
	
	input {
		background-color: #cc5;
	}
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function checkPasswd(password){
		var elemSpanCheckPasswdResult = document.getElementById("checkPasswdResult");
		var regex = /^[a-zA-Z0-9!@$#%^&*]{8,16}$/;
		var upperRegex = /[A-Z]/;
		var lowerRegex = /[a-z]/;
		var numRegex = /[0-9]/;
		var speRegex = /[!@#$%^&*]/;
		var count = 0 ;
		
		if(regex.exec(password)){
			if(upperRegex.exec(password)){
				count++;
			}
			if(lowerRegex.exec(password)){
				count++;
			}
			if(numRegex.exec(password)){
				count++;
			}
			if(speRegex.exec(password)){
				count++;
			}
			
			if(count==4){
				elemSpanCheckPasswdResult.innerHTML = "사용가능 : 안전";
				elemSpanCheckPasswdResult.style.color = "green";
			}else if(count == 3){
				elemSpanCheckPasswdResult.innerHTML = "사용가능 : 보통";
				elemSpanCheckPasswdResult.style.color = "yellow";
			}else if(count == 2){
				elemSpanCheckPasswdResult.innerHTML = "사용가능 : 위험";
				elemSpanCheckPasswdResult.style.color = "orange";
			}
		}else{
			elemSpanCheckPasswdResult.innerHTML = "영문 대소문자, 숫자, 특수문자 조합 8~16자리 필수!";
			elemSpanCheckPasswdResult.style.color = "RED";
			document.fr.passwd.select();
		}
	}
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
		
	function itemSelect(){
		for(let i of document.fr.emailDomain.options){
			if(i.selected){
// 				alert(document.fr.email2.value);
				document.fr.email2.value=i.value;
// 				alert(document.getElementsByName('email2').value);
			}
		}
	}
	
	function checkId(){
		if(document.fr.id.value.length>8 || document.fr.id.value.length<4){
			alert("아이디는 4~8자리 필수!");
			document.fr.id.focus();
		}
	}
	
	function winOpen(){
		window.open("MemberCheckIdForm.me","ID중복확인","width=400, height=200");
	}
	
	function checkPassLength(){
		if(document.fr.passwd.value.length<8 || document.fr.passwd.value.length>16){
			alert("패스워드는 8~16자리 필수!");
			document.fr.passwd.focus();
		}
	}
	
	function execDaumPostcode(){
// 		alert("주소검색!");
		 new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		 			window.close();
	            }
	      }).open(true);
		 
	
	}
</script>
</head>
<body>
	<!-- id 중복확인 버튼 클릭 시 새 창 띄우기(check_id.jsp 파일 열기)  -->
	<form action="MemberJoinPro.me" method="post" name="fr">
		<h1>회원상세정보</h1>
		<table border="1">
			<tr>
				<td><input type="text" value="이름" readonly="readonly"></td>
				<td><input type="text" name="name"></td>
			</tr>
										<!--  아이디 -->			
			<tr>
				<td><input type="text" value="ID" readonly="readonly">
				<td><input type="text" name="id" placeholder="아이디 중복확인 버튼 클릭" readonly="readonly" required="required" >
				<input type="button" value="ID중복확인" onclick="winOpen()"></td>
			</tr>
										<!--  비밀번호 -->
			<tr>
				<td><input type="text" value="비밀번호"  readonly="readonly"></td>
				<td><input type="password" placeholder="영문자,숫자,특수문자 8~16글자" name="passwd" required="required" onchange="checkPasswd(this.value)">
				<span id="checkPasswdResult"></span></td>
			</tr>
			
			<tr>
				<td><input type="text" value="비밀번호확인"  readonly="readonly"></td>
				<td><input type="password" name="passwd2" required="required" onkeyup="checkPassword()">
				<span id="checkPass"></span>
				</td>
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
			
										<!-- 주소 -->
			<tr>
				<td> <input type="text" readonly="readonly" value="주소"></td>
				<td>
					<input type="text" id="sample4_postcode" name="post_code" placeholder="우편번호" readonly="readonly" onclick="execDaumPostcode()">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" name="address1" placeholder="도로명주소" readonly="readonly" required="required" onclick="execDaumPostcode()">
					<input type="text" id="sample4_detailAddress" name="address2" placeholder="상세주소" required="required">
				</td>	
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