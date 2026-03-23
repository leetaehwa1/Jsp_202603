<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin: 30px;
	}
		table, th, tr, td{
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center; 
	}
	th {
		width : 50px;
		background-color: #eee;
	}
	td {
		width : 250px;
	}
</style>
</head>
<body>
	<%@ include file="../../DB.jsp" %>
	
	<%
		String stuNo = request.getParameter("stuNo");
		String sql = "SELECT * FROM STUDENT WHERE STU_NO = " + stuNo;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
		String grade = rs.getString("STU_GRADE");
	%>
	<form action="stu-edit-result.jsp" name="form">
		<input name="stuNo" hidden value="<%= stuNo %>">
			<table>
				<th>학 년</th>
				<td>
					<label>
					<input name="grade" type="radio" <%= grade.equals("1") ? "checked" : "" %>value="1" checked> 1학년 
					</label>
					<label>
					<input name="grade" type="radio" <%= grade.equals("2") ? "checked" : "" %>value="2"> 2학년 
					</label>
					<label>
					<input name="grade" type="radio" <%= grade.equals("3") ? "checked" : "" %> value="3"> 3학년
					</label>
				</td>
			</tr>
			<tr>
				<th>학 번</th>
					<td><input type="text" name="stuNo" value="<%= rs.getString("STU_NO")%>"></td>
			</tr>
			<tr>
				<th>이 름</th>
					<td>
						<input type="text" name="name" value="<%= rs.getString("STU_NAME") %>">
					</td>
			</tr>
			<tr>
				<th>학 과</th>
					<td>
						<input type="text" name="dept" value="<%= rs.getString("STU_DEPT") %>">
					</td>
			</tr>
			</table>
			<div>
			<input type="button" value="수정하기" onclick="fnEdit()">
			<input type="reset" value="초기화">
			<a href="stu-list.jsp"><input type="button" value="되돌아가기"></a>
		</div>
	</form>
	 <%
		}else{
			out.println("학생 없음.");
		}
	 %>
</body>
</html>
<script>
function fnEdit() {	
	let form = document.form;
	
	form.submit();
	
}
</script>