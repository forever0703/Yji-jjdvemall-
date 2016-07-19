<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String memberId = request.getParameter("memberId");
String memberPw = request.getParameter("memberPw");
System.out.println(memberId + "<-- memberId loginAction.jsp");
System.out.println(memberPw + "<-- memberPw loginAction.jsp");
boolean memberLogin = false;

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
String dbUser = "root";
String dbPw = "java0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

 try{

	Class.forName(driver);

	conn = DriverManager.getConnection(url, dbUser, dbPw);
	String sql = "SELECT member_id, member_pw,member_name,member_gender,member_age FROM member WHERE member_id=? AND member_pw=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, memberId);
	pstmt.setString(2, memberPw);
	
	rs = pstmt.executeQuery();
	
	System.out.println(pstmt);
	
	if(rs.next()){
		memberLogin = true;
		session.setAttribute("memberId", rs.getString("member_id"));
		session.setAttribute("memberLogin", memberLogin);
	
		response.sendRedirect(request.getContextPath()+"/member/memberIndex.jsp");
	}else{
	
		response.sendRedirect(request.getContextPath()+"/member/memberAddform.jsp");
	}
			} finally {
			
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				
		
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}	
				
				
%> 
</body>
</html>