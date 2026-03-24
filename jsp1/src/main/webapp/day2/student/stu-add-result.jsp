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
		String stuNo = request.getParameter("stuNo");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String grade = request.getParameter("grade");
		String sql = "INSERT INTO STUDENT (STU_NO, STU_NAME, STU_DEPT, STU_GRADE) VALUES ("
				+ "'" + stuNo + "', "
				+ "'" + name + "', "
				+ "'" + dept + "', "
				+ "'" + grade + "')";
		int result = stmt.executeUpdate(sql);
		if(result > 0){
			/* 게시글 목록으로 이동 */
			response.sendRedirect("stu-list.jsp");
		}else{
			out.println("오류 발생");
		}
	%>
</body>
</html>