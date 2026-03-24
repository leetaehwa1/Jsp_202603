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
	}
	td {
		width : 200px;
	}
	div{
		margin-top: 10px;
	}
</style>
</head>
<body>
<form action="stu-add-result.jsp" name="form">
		<table>
			<tr>
				<th>학 년</th>
				<td>
					<label><input name="grade" type="radio" value="1" checked> 1학년 </label>
					<label><input name="grade" type="radio" value="2"> 2학년 </label>
					<label><input name="grade" type="radio" value="3"> 3학년 </label>
					
				</td>
			</tr>
			<tr>
				<th>학 번</th>
					<td><label><input type="text" name="stuNo"></td></label>
			</tr>
			<tr>
				<th>이 름</th>
					<td><label><input type="text" name="name"></td></label>
			</tr>
			<tr>
				<th>학 과</th>
					<td><label><input type="text" name="dept"></td></label>
			</tr>
		</table>
		<div>
			<input type="button" value="추가하기" onclick="fnAdd()">
			<input type="reset" value="초기화">
			<a href="stu-list.jsp"><input type="button" value="되돌아가기"></a>
		</div>
	</form>
</body>
</html>
<script>
	function fnAdd() {	
		let form = document.form;
		if(form.name.value.length == 0){
			alert("이름을 입력하세요.");
			return;
		}
		if(form.stuNo.value.length == 0){
			alert("학번을 입력하세요");
			return;
		}
		if(form.dept.value.length == 0){
			alert("학과를 입력하세요");
			return;
		}
		alert("추가 완료.");
		form.submit();
		
	}
</script>