<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../DB.jsp" %>
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		/* TBL_USER 테이블에 USERID, PWD 컬럼값과 비교하여 */
		/* 동일한 데이터 있으면 '로그인 성공' 출력*/
		/* 둘 중 하나라도 다르면 '로그인 실패' 출력 */
	
		String sql = "SELECT * FROM TBL_USER "
					+" WHERE USERID = '" + userId + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(!(rs.next())){
			out.println("해당 아이디는 존재하지 않습니다.");
		} else{
			String dbPwd = rs.getString("PWD");
				
			if(dbPwd.equals("pwd")){
				out.println("로그인 성공");
			}else{
				out.println("비밀번호를 확인해주세요");
			}
		}
		/* 아이디 없는 경우 : '해당 아이디는 존재하지 않습니다.' */
		/* 아이디는 있는데 비밀번호 다른 경우 : '비밀번호를 확인해주세요' */
	%>
		
		
	
</body>
</html>