<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String Id = request.getParameter("memberId");
	String Pw = request.getParameter("memberPw");
	String Name = request.getParameter("memberName");
	String Gender = request.getParameter("memberGender");
	String Age = request.getParameter("memberAge");
	
	System.out.println(Id+"<--memberId");
	System.out.println(Pw+"<--memberPw");
	System.out.println(Name+"<--memberName");
	System.out.println(Age+"<--memberAge");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	java.sql.Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","k202","java0000");
	PreparedStatement stmt = conn.prepareStatement("insert into member( member_id, member_pw,  member_name,  member_gender, member_age) values(?,?,?,?,?)");
	stmt.setString(1,Id);
	stmt.setString(1,Pw);
	stmt.setString(1,Name);
	stmt.setString(1,Gender);
	stmt.setString(1,Age);
	
	stmt.executeUpdate();
	

%>

</body>
</html>