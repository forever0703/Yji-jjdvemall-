<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
	table,td {
		border:1px solid #000000;
	}
</style>
</head>
<body>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
String dbUser = "root";
String dbPw = "java0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select member_no,member_id,member_pw,member_name,member_gender,member_age from member";

try{
	
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, dbUser, dbPw);
	
	pstmt = conn.prepareStatement(sql);

	rs = pstmt.executeQuery();
}
%>
	<table>
		<tr>
			<td>member_no</td>
			<td>member_id</td>
			<td>member_pw</td>
			<td>member_name</td>
			<td>member_gender</td>
			<td>member_age</td>
		</tr>
<%	
	while(rs.next()){
		out.print("<tr><td>"+rs.getInt("member_no")+"</td>");	
		out.print("<td>"+rs.getString("member_id")+"</td>");	
		out.print("<td>"+rs.getString("member_pw")+"</td>");	
		out.print("<td>"+rs.getString("member_name")+"</td>");	
		out.print("<td>"+rs.getString("member_gender")+"</td>");	
		out.print("<td>"+rs.getInt("member_age")+"</td></tr>");	
	}
%>
</table>
<%
}finally{
	if(rs != null) try{rs.close(); } catch(SQLException ex){}
	if(pstmt != null) try{pstmt.close(); } catch(SQLException ex){}
	if(conn != null) try{conn.close(); } catch(SQLException ex){}

}
%>

</body>
</html>