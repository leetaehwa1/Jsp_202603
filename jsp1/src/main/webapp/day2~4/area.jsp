<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>

<body>
<form action="area.jsp" name="form">
	<%@ include file="../DB.jsp" %>
	시/도 : <select onchange="fnSelect()" name="paramSi">	
		<option value=""> :: 선택 :: </option>
	<%
		String paramSi = request.getParameter("paramSi");
		String sql = "SELECT DISTINCT SI FROM AREA";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			String si = rs.getString("SI");
			String selected = si.equals(paramSi) ? "selected" : "";
	%>
		<option value="<%= si %>" <%= selected %>><%= si %></option>
	<%
		}
	 %>
	</select>
	구 : <select onchange="fnSelect()" name="paramGu">	
		<option value=""> :: 선택 :: </option>
		<%
			String paramGu = request.getParameter("paramGu");
			paramGu = paramGu != null ? paramGu : "" ;
			sql = "SELECT DISTINCT GU FROM AREA WHERE GU IS NOT NULL ";
			sql += " AND SI = '" + paramSi + "'";
			
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				String gu = rs.getString("GU");
				String selected = paramGu.equals(gu) ? "selected" : "";
		%>
			<option value="<%= gu %>" <%= selected %>><%= gu %> </option>
		<%
			}
		%>
		</select>
		
		동 : <select onchange="fnSelect()" name="paramDong">	
		<option value=""> :: 선택 :: </option>
		<%
			String paramDong = request.getParameter("paramDong");
			paramDong = paramDong != null ? paramDong : "" ;
			sql = "SELECT DISTINCT DONG FROM AREA WHERE DONG IS NOT NULL ";
			sql += " AND SI = '" + paramSi + "' AND GU = '" + paramGu + "'";
			
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				String dong = rs.getString("DONG");
				String selected = paramDong.equals(dong) ? "selected" : "";
		%>
			<option value="<%= dong %>" <%= selected %>><%= dong %> </option>
		<%
			}
		%>
</form>
</body>
</html>
<script>
 	function fnSelect() {
		document.form.submit();		
	}
</script>