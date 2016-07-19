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
String adminId = request.getParameter("adminId");
String adminPw = request.getParameter("adminPw");
System.out.println(adminId + "<-- adminId adminloginAction.jsp");
System.out.println(adminPw + "<-- adminPw adminloginAction.jsp");

boolean adminLogin = false;

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
	String sql = "SELECT admin_id,admin_pw,admin_level FROM admin WHERE admin_id=? AND admin_pw=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, adminId);
	pstmt.setString(2, adminPw);
	
	System.out.println(pstmt);
	
	rs = pstmt.executeQuery();
	
	
	
	if(rs.next()){
		adminLogin = true;
		session.setAttribute("adminId", rs.getString("admin_id"));
		session.setAttribute("adminLevel", rs.getInt("admin_level"));
		session.setAttribute("adminLogin", adminLogin);
	
		response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
	}else{
	
		response.sendRedirect(request.getContextPath()+"/admin/login/adminloginAction.jsp");
	}
			} finally {
			
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				
		
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}	
				
				
%> 
</body>
</html>