<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, tr, td{
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center; 
	}
</style>
</head>
<body>
	<%@ include file="../../DB.jsp" %>
	<form>
		<table>
			<tr>
				<th>제품번호</th>
				<th>제품이름</th>
				<th>브랜드</th>
				<th>가격</th>
				<th>출시일</th>
			</tr>
				
			<%
				String sql = "SELECT P.*, TO_CHAR(RELEASE_DATE, 'YYYY-MM-DD') AS RELEASE FROM PRODUCT P";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
			%>
					<tr>
						<td><%= rs.getString("PRODUCT_ID") %>
						<td>
						<a href="product-view.jsp?productId=<%= rs.getString("PRODUCT_ID") %> ">
							<%= rs.getString("PRODUCT_NAME") %>
						</a>
						<td><%= rs.getString("BRAND") %>
						<td><%= rs.getString("PRICE") %>
						<td><%= rs.getString("RELEASE") %>
					</tr>
			<% 
				}
			%>
		</table>
	</form>
</body>
</html>