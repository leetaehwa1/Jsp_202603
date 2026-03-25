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
		width : 200px;
	}
</style>
</head>
<body>
	<%@ include file="../../DB.jsp" %>
	<%
		String boardNo = request.getParameter("boardNo");
		String sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
		String kind = rs.getString("KIND");
			 
			 
	%>
		 

	<form action="board-edit-result.jsp" name="form">
		<input type="hidden" name="boardNo" value="<%= boardNo %>">
		<table>
			<tr>
				<th>종 류</th>
				<td>
					<label>
					<input name="kind" type="radio" <%= kind.equals("1") ? "checked" : "" %> value="1" checked> 공지사항 </label>
					<label>
					<input name="kind" type="radio" <%= kind.equals("2") ? "checked" : "" %>value="2"> 자유게시판 
					</label>
					<label>
					<input name="kind" type="radio"<%= kind.equals("3") ? "checked" : "" %> value="3"> 문의게시판 
					</label>
					
					
				</td>
			</tr>
			<tr>
				<th>제 목</th>
					<td><input type="text" name="title" value="<%= rs.getString("TITLE")%>"></td>
			</tr>
			<tr>
				<th>내 용</th>
					<td>
						<textarea rows="10" cols="40" name="contents"><%= rs.getString("CONTENTS")%></textarea>
					</td>
			</tr>
		</table>
		<div>
			<input type="button" value="수정하기" onclick="fnEdit()">
			<input type="reset" value="초기화">
			<a href="board-list.jsp"><input type="button" value="되돌아가기"></a>
		</div>
	</form>
	<% 
		 }else{
			 out.println("데이터 조회 실패!");
		 }
	%>
</body>
</html>
<script>
	function fnEdit() {	
		let form = document.form;
		if(form.title.value.length == 0 || form.contents.value.length == 0){
			alert("제목 및 내용 입력하세요.");
			return;
		}
		
		
		form.submit();
		
	}
</script>