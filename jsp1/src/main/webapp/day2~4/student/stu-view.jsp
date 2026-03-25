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
		
	}
	th {
		width : 50px;
		background-color: #ccc; 
	}
	td {
		width : 200px;
	}
	.contents{
		height: 200px;
	}
	.btn-area{
		margin-top:5px; 
	}
</style>
</head>
<body>
	<%@ include file="../../DB.jsp" %>
	<form action="" name="form">
	<%
		String stuNo = request.getParameter("stuNo");
	%>
	<input name="stuNo" value="<%= stuNo %>" hidden> 
	
		<table>
			<%
				
				String sql = "SELECT * FROM STUDENT WHERE STU_NO = " + stuNo;
				ResultSet rs = stmt.executeQuery(sql);
				
				if(rs.next()){
			%>
					<tr>
						<th>학년</th>
						<td><%= rs.getString("STU_GRADE") %></td>
					 </tr>
					 <tr>
					 	<th>이름</th>
					 	<td><%= rs.getString("STU_NAME") %></td>
					 </tr>	
					 <tr>
					 	<th>학번</th>
					 	<td><%= rs.getString("STU_NO") %></td>
					 </tr>
					 <tr>
					 	<th>학과</th>
					 	<td><%= rs.getString("STU_DEPT") %></td>
					 </tr>
					
			<% 
				}else{
					out.println("학생이 존재하지 않습니다");
				}
			%>
		</table>
		<div class="btn-area">
			<input type="button" value="수정하기" onclick="fnEdit()">
			<input type="button" value="삭제하기" onclick="fnRemove()">
			<input type="button" value="되돌아가기">
		</div>
	</form>
</body>
</html>
<script>
	function fnEdit() {
		let form = document.form;
		form.action = "stu-edit.jsp";
		form.submit();
	}
	
	
	function fnRemove() {
		console.log(<%= stuNo %>);
		location.href = "stu-remove.jsp?stuNo=" + <%= stuNo %>;
		
		/* let form = document.form;
		form.action = "board-remove.jsp";
		form.submit(); */
	}
</script>