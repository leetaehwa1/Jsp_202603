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
		background-color: gray; 
	}
	td {
		width : 200px;
	}
	.contents{
		width: 550px;
		height: 200px;
	}
	.btn-area{
		margin-top:5px; 
	}
	.line{
		margin: 30px 0px;
		border-bottom: 1px solid #eee;
	}
	.comment-area td{
		width: 550px;
	}
	.comment-area th{
		width: 100px;
	}
</style>
</head>
<body>
	<%@ include file="../../DB.jsp" %>
	<form action="" name="form">
	<%
		String sessionId = (String)session.getAttribute("sessionId");
		String sessionRole = (String)session.getAttribute("sessionRole");
		String boardNo = request.getParameter("boardNo");
	%>
	<input name="boardNo" value="<%= boardNo %>" hidden> 
	
		<table>
			<%
				
				String sql = "UPDATE TBL_BOARD SET CNT = CNT + 1 " 
							+ "WHERE BOARDNO = " + boardNo;
				stmt.executeUpdate(sql);
			
				sql = "SELECT * FROM TBL_BOARD WHERE BOARDNO = " + boardNo;
				ResultSet rs = stmt.executeQuery(sql);
				String userId = "";
				if(rs.next()){
					userId = rs.getString("USERID");
			%>
					<tr>
						<th>제목</th>
						<td colspan="3"><%= rs.getString("TITLE") %></td>
					 </tr>
					 <tr>
					 	<th>작성자</th>
					 	<td><%= rs.getString("USERID") %></td>
					 	<th>조회수</th>
					 	<td><%= rs.getString("CNT") %></td>
					 </tr>
					 <tr>
					 	<th>작성일</th>
					 	<td colspan="3"><%= rs.getString("CDATETIME") %></td>
					 </tr>
					 <tr>
					 	<th>내용</th>
					 	<td colspan="3" class="contents"><%= rs.getString("CONTENTS") %></td>
					 </tr>
			<% 
				}else{
					out.println("게시글 존재하지 않습니다");
				}
			%>
		</table>
		<div class="btn-area">
		<%
		if(userId.equals(sessionId) || sessionRole.equals("A")){
		%>
			<input type="button" value="수정하기" onclick="fnEdit()">
			<input type="button" value="삭제하기" onclick="fnRemove()">
		<% 
			}
		%>
			<input type="button" value="되돌아가기">
		</div>
		<div class="line">
		</div>
		
		<div class="comment-area">
		<table>
			<%
				sql = "SELECT * FROM TBL_COMMENT WHERE BOARDNO = " + boardNo 
				+	" ORDER BY CDATETIME ASC";
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					
			%>
				<tr>
					<th><%= rs.getString("USERID") %></th>
					<td><%= rs.getString("CONTENTS") %></td>
				</tr>
			<% 
				}
				%>
		</table>
		<table>
			<tr>
			<th>댓글 등록</th>
			<td style="width :470px; border-right:none;">
			<textarea cols="60" rows="5" name="contents"></textarea></td>
			<td style="width :60px; border-left:none;">
			<input type="button" value="등록" onclick="fnCommentAdd()">
			
			</td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>
<script>
	function fnEdit() {
		let form = document.form;
		form.action = "board-edit.jsp";
		form.submit();
	}
	
	
	function fnRemove() {
		console.log(<%= boardNo %>);
		location.href = "board-remove.jsp?boardNo=" + <%= boardNo %>;
		/* let form = document.form;
		form.action = "board-remove.jsp";
		form.submit(); */
	}
	function fnCommentAdd() {
		let form = document.form;
		form.action = "board-comment-add.jsp";
		form.submit();
	}
</script>