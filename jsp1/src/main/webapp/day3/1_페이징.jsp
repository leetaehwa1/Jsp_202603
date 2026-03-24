<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
		width : 800px;
		margin : 10px auto;
	}
	table{
		margin : 0 auto;
	}
	body {
		margin : 30px;
	}
	table, th, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
		
	}
	th {
		background-color: #eee;
	}
	.paging-area {
		text-align: center
	}
</style>
</head>
<body>
	
<div id="container">
	<form action="board-list.jsp" name="form">
	<%@ include file="../../DB.jsp" %>
	<div>
		<select>
			<%
				int[] arr= {3, 5, 10, 15, 20};
				for(int i=0;i<arr.length;i++){
				%>	
					<option value="<%= arr[i] %>"><%= arr[i] %> 개씩 </option>
				
				<% 
				}
			%>
		</select>
	</div>
	<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		<%	
			
			String sql = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') AS CDATE "
						+ "FROM TBL_BOARD B WHERE 1=1 ";
			
			if(true){
				sql += "ORDER BY BOARDNO ASC ";	
			}
			if(true){
				sql += "OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY";
			}
			
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
		%>
				<tr>
					<td><%= rs.getString("BOARDNO") %></td>
					<td><%= rs.getString("TITLE") %></td>
					<td><%= rs.getString("USERID") %></td>
					<td><%= rs.getString("CNT") %></td>
					<td><%= rs.getString("CDATE") %></td>
				</tr>	
		<%		
			}
		%>
		</table>
		<div class="paging-area">
			
		</div>
	</form>
</div>
</body>
</html>
<script>
</script>