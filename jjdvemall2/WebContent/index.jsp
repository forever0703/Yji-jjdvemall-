<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	div
	{	
		border: 1px solid #000000;
		width: 50%;
		margin: 0 auto;
		padding-top: 20px;
	}
</style>

<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
%>
		<div>
			<h1> 화면</h1>
		</div>
		
		
		<div>
			<ul>
				<li><a href="<%=request.getContextPath() %>/admin/login/adminlogin.jsp">관리자 로그인</a></li>
				
				<li><a href="<%=request.getContextPath() %>/member/memberlogin.jsp">회원 로그인</a></li>
			</ul>
		</div>
	
	
</body>
</html> <!-- 박학철님 폼 참고 -->