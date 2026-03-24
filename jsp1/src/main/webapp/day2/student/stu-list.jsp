<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 추가</title>
<style>
		table, th, tr, td{
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center; 
	}
	.search-area{
		margin:10px 0px;
	}
</style>
</head>
<body>
	<%@ include file="../../DB.jsp" %>
	<form action="stu-list.jsp" name="form">
	<div>
	
	</div>
	<% 
	String dept = request.getParameter("dept");
	dept = dept != null ? dept : "";
	%>
	<div>
		<select name="dept" onchange="fnDept(this.value)">
			<option value="">:: 전체 ::</option>
			<option value="기계" <%= dept.equals("기계") ? "selected" : "" %>>:: 기계 ::</option>
			<option value="전기전자" <%= dept.equals("전기전자") ? "selected" : "" %>>:: 전기전자 ::</option>
			<option value="컴퓨터정보" <%= dept.equals("컴퓨터정보") ? "selected" : "" %>>:: 컴퓨터정보 ::</option>
		</select>
	</div>

	<%
		String keyword = request.getParameter("keyword");
		/* if(keyword == null){
			keyword = "";
		} */
		
	%>
	
		
	<div class="search-area">
		<label>검색 : <input name="keyword" value="<%= keyword != null ? keyword : "" %>"></label>
		<input type="submit" value="검색">
		
	</div>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>과목</th>
			<th>학년</th>
		</tr>
	<%
	
		String sql = "SELECT * FROM STUDENT WHERE 1=1 ";
		if(keyword != null ){
			sql += "AND ("
					+ "STU_NAME LIKE '%" + keyword + "%' OR "
					+ "STU_NO LIKE '%" + keyword + "%' OR "
					+ "STU_DEPT LIKE '%" + keyword + "%' OR "
					+ "STU_GRADE LIKE '%" + keyword + "%'"
					+ ") ";
		}
		
		if(dept != null && !dept.equals("")){
			sql += "AND STU_DEPT = '" + dept +"' ";
		}
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
		<tr>
			<td><%= rs.getString("STU_NO") %></td>
			<td><a href="javascript:;" onclick="fnView(<%= rs.getString("STU_NO") %>)"><%= rs.getString("STU_NAME") %></a></td>
			<td><%= rs.getString("STU_DEPT") %></td>
			<td><%= rs.getString("STU_GRADE") %></td>	
		</tr>
		<% 
			}
		%>
	</table>
	<div>
		<input type="button" value="학생 추가" onclick="fnAdd()"> 
	</div>
	
	</form>
</body>
</html>
<script>
	function fnAdd() {
		// stu-add.jsp
		location.href = "stu-add.jsp";
	}
	function fnView(stuNo) {
		location.href = "stu-view.jsp?stuNo=" + stuNo;
	}
	function fnDept() {
		document.form.submit();
	}
</script>