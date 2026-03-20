<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 아이디, 비밀번호, 비밀번호 확인, 이름, 나이를 입력받아서 -->
	<!-- submit 실행 시 12_signup-result.jsp 로 보내기 -->
	<!-- 단, 모든 값은 빈 값 x -->
	<!-- 비밀번호, 비밀번호 확인은 같은 값이여야 함. -->
	<!-- 12_signup-result.jsp 에서는 받은 값을 출력  -->
	<!-- 아이디 : 000, 이름 : 000 -->
	
	
	<form action="12_signup-result.jsp" name="signup" method="get">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd1" type="password"></label>
		</div>
		<div>
			<label>비밀번호 확인 : <input name="pwd2" type="password"></label>
		</div>
		<div>
			<label>이름 : <input name="name"></label>
		</div>
		<div>
			<label>나이 : <input name="age"></label>
		</div>
		<div>
			<input type="button" value="회원가입" onclick="fnSignUp()">
		</div>
	</form>
</body>
</html>
<script>
	function fnSignUp(){
		let signup = document.signup;
		 console.log(signup.userId.value); 
		 if(signup.userId.value.length == 0){
			 alert("아이디 입력하세요");
			 signup.userId.focus();
			 return;
		 }
		 if(signup.pwd1.value.length == 0){
			 alert("비밀번호를 입력하세요");
			 signup.pwd1.focus();
			 return;
		 }
		 if(signup.pwd1.value != signup.pwd2.value){
			 alert("비밀번호가 일치하지 않습니다.")
			 signup.pwd2.focus();
			 return;
		 }
		 if(signup.name.value.length == 0){
			 alert("이름을 입력하세요");
			 signup.name.focus();
			 return;
		 }
		 if(signup.age.value.length == 0){
			 alert("나이를 입력하세요");
			 signup.age.focus();
			 return;
		 }
		// 위 조건을 모두 만족했을 때, 최종 submit(action 페이지 호출)
		signup.submit();
		
	}
</script>