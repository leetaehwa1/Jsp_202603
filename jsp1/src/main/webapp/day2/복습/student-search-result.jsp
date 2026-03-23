<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../DB.jsp" %>
	<% 
		/* 학번은 8글자가 아니면 다음 페이지로 안 넘어감 
		 student-search-result 에서는 입력한 학번의 학생이 있을 경우 
		 '해당 학생의 이름은 000 입니다' 출력
		없으면 '조회에 실패했습니다' 출력 */
		String stuNo = request.getParameter("stuNo");
	
		/* String sql = String.format(
				"SELECT * FROM STUDENT WHERE STU_NO = '%s' AND STU_NAME = '%s'", stuNo, stuName); */
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'"	;	
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			out.println("해당 학생의 이름은 " + rs.getString("STU_NAME") + " 입니다");
		}else{
			out.println("조회에 실패했습니다");
			return;
		}
		
		
		
	%>
	
</body>
</html>
<script></script>
