<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체member select</title>
</head>

<style>
table, td {border : 1px solid #000000}
</style>
<body>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet PrintRs = null;
	String sql = "Select * from member";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbId = "root";
		String dbPw = "java0000";
		conn = DriverManager.getConnection(Url, dbId, dbPw);
		conn.setAutoCommit(false);
		stmt = conn.prepareStatement(sql);
		
		PrintRs = stmt.executeQuery();
		
		
		conn.commit();
%>
<h1>회원리스트</h1>
<form>
<table>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>성별</td>
		<td>나이</td>
	</tr>
	<%
		while (PrintRs.next()) {
	%>
	<tr>
		<td><%=PrintRs.getInt("member_no")%></td>
		<td><a href="<%=request.getContextPath()%>/admin/member/memberList.jsp?sandNomber=<%=PrintRs.getInt("member_no")%>"><%=PrintRs.getString("member_id")%></a></td>
		<td><%=PrintRs.getString("member_pw")%></td>
		<td><%=PrintRs.getString("member_name")%></td>
		<td><%=PrintRs.getString("member_gender")%></td>
		<td><%=PrintRs.getInt("member_age")%></td>
	</tr>
	<%
		}
	} catch (Exception e) {
		conn.rollback();
		e.printStackTrace();
	} finally {
		
		if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}

		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}  
%>


<!-- 참고 코트 이예은님 -->
</table>
</form>
</body>
</html>