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
		
		/* 열명을 올바르게 지정해야됨.  */
		String sql = "UPDATE STUDENT SET "
				+ "STU_NO = '" + stuNo + "',"
				+ "STU_NAME = '" + name + "',"
				+ "STU_DEPT = '" + dept + "',"
				+ "STU_GRADE = " + grade + ""
				+ "WHERE STU_NO = '" + stuNo + "'"; 
	int result = stmt.executeUpdate(sql);
		
	%>
</body>
</html>
<script>
let result = <%= result %>
if(result > 0){
	alert("수정되었습니다.");
}else{
	alert("수정에 실패했습니다.");
}
location.href="stu-list.jsp";
</script>