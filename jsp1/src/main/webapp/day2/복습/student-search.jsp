<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 학번은 8글자가 아니면 다음 페이지로 안 넘어감 -->
	<!-- student-search-result 에서는 입력한 학번의 학생이 있을 경우 -->
	<!-- '해당 학생의 이름은 000 입니다' 출력 -->
	<!-- 없으면 '조회에 실패했습니다' 출력 -->
	<form action="student-search-result.jsp" name="search">
		<div>
			학번 : <input type="text" name="stuNo">
				  <input type="button" value="검색" onclick="fnSearch()">
		</div>
		
	
	</form>
</body>
</html>
<script>
	function fnSearch() {
		let search = document.search;
		if(!(search.stuNo.value.length == 8)){
			alert("학번은 8글자 입니다");
			return;
		}
		search.submit();
		
	}
</script>