<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
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
	int Age =Integer.parseInt(request.getParameter("memberAge"));
	String Add = request.getParameter("memberAddress");
	
	System.out.println(Id+"<--memberId");
	System.out.println(Pw+"<--memberPw");
	System.out.println(Name+"<--memberName");
	System.out.println(Gender+"<--memberGender");
	System.out.println(Age+"<--memberAge");
	System.out.println(Add+"<--memberAddress");
	
	Connection conn = null;
	
	try{
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPw = "java0000";
	
	
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	
	conn.setAutoCommit(false);
	String sql1 = "insert into member( member_id, member_pw,  member_name,  member_gender, member_age) values(?,?,?,?,?)"; 
	PreparedStatement stmt1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
	stmt1.setString(1,Id);
	stmt1.setString(2,Pw);
	stmt1.setString(3,Name);
	stmt1.setString(4,Gender);
	stmt1.setInt(5,Age);
	stmt1.executeUpdate();
	
	int result= stmt1.executeUpdate();
	if(result != 0){
		ResultSet rs = stmt1.getGeneratedKeys();
		int key = 0;
			if(rs.next()){
			key = rs.getInt(1);
			System.out.println(key + "key");
		}
	String sql2 = "insert into address(member_no,member_address) VALUES(?,?)";
	PreparedStatement stmt2 = conn.prepareStatement(sql2);
	stmt2.setInt(1,key);
	stmt2.setString(2,Add);
	result = stmt2.executeUpdate();
	
	conn.commit();
	}}catch(Exception e){
		conn.rollback();
		e.printStackTrace();
	}
%>
</body>
</html>