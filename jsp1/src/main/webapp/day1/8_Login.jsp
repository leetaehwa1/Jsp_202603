<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp 핵심 => form 태그 -->
	<!-- form 태그 내의 submit 버튼 클릭 시 action 페이지로 이동 -->
	<!-- 이때, form 태그 내부에 있는 input 에 있는 값을 request 객체에 담아서 이동 -->
	<!-- input 의 name 속성이 키(key), 입력 받은 값이 value -->
	
	
	<!-- method 는 옵션, get 방식과 post 방식, 디폴트는 get -->
	<!-- get 방식은 url (주소)에 값을 담아서 보낸다. 보안에 취약하지만 빠르다. -->
	<!-- 사용자 개인정보나 패스워드 등을 전송할 때는 사용 x -->
	
	<!-- post 방식은 데이터를 숨겨서 보낸다. -->
	
	<!-- 실습할 때는 데이터 확인을 위해서 get 을 사용. -->
	
	<form action="9_LoginResult.jsp" method="get">
		<div>
			<label>아이디 : <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호 : <input name="pwd" type="password"></label>
		</div>
		<div>
			<!-- submit 버튼은 클릭하면 form 태그의 action 페이지로 이동한다. -->
			<input type="submit" value="로그인">
		</div>
	</form>
</body>
</html>