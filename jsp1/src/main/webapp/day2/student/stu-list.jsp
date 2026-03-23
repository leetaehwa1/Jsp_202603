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
	<%
		String keyword = request.getParameter("keyword");
		/* if(keyword == null){
			keyword = "";
		} */
	%>
	<form action="stu-list.jsp">
	<%@ include file="../../DB.jsp" %>
		
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
		if(keyword != null){
			sql += "AND ("
					+ "STU_NAME LIKE '%" + keyword + "%' OR "
					+ "STU_NO LIKE '%" + keyword + "%' OR "
					+ "STU_DEPT LIKE '%" + keyword + "%' OR "
					+ "STU_GRADE LIKE '%" + keyword + "%'"
					+ ")";
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
		// board-add.jsp
		
		location.href = "stu-add.jsp";
	}
	function fnView(stuNo) {
		location.href = "stu-view.jsp?stuNo=" + stuNo;
	}
</script>