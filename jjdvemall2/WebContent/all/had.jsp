<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap">

<div id="header">
<h1><a href="#">JJdevmall</a></h1>
<h2>제작:양정익 참고:한국스마트정보교육원 202반</h2>
</div>

<div id="menu">
<ul>
<li><a href="#">Home</a></li>
<li><a href="#">About</a></li>
<li><a href="#">Photos</a></li>
<li><a href="#">Links</a></li>
<li><a href="#">Forum</a></li>
<li><a href="#">Free Stuff</a></li>
<li><a href="#">Downloads</a></li>
<li><a href="#">Products</a></li>
<li><a href="<%=request.getContextPath() %>/admin/login/adminlogin.jsp">관리자 로그인</a></li>
<li><a href="<%=request.getContextPath() %>/member/memberlogin.jsp">회원 로그인</a></li>
</ul>
</div>

</body>
</html>