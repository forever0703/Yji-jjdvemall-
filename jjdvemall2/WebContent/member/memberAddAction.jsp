<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	String Id = request.getParameter("memberId");
	String Pw = request.getParameter("memberPw");
	String Name = request.getParameter("memberName");
	String Gender = request.getParameter("memberGender");
	int Age = Integer.parseInt(request.getParameter("memberAge"));
	/* int Age =Integer.parseInt(request.getParameter("memberAge"));  */
	String Add = request.getParameter("memberAddress");
	
	System.out.println(Id+"<--memberId");
	System.out.println(Pw+"<--memberPw");
	System.out.println(Name+"<--memberName");
	System.out.println(Gender+"<--memberGender");
	System.out.println(Age+"<--memberAge");
	System.out.println(Add+"<--memberAddress");
	
 	Connection conn = null;
 	PreparedStatement memstmt = null;
 	PreparedStatement Addstmt = null;
 	
 try{ 
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPw = "java0000";
		
		Class.forName(driver);
	
		conn = DriverManager.getConnection(url, dbUser, dbPw);
	
		conn.setAutoCommit(false);
		String sql1 = "insert into member( member_id, member_pw,  member_name,  member_gender, member_age) values(?,?,?,?,?)"; 
		memstmt = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
		memstmt.setString(1,Id);
		memstmt.setString(2,Pw);
		memstmt.setString(3,Name);
		memstmt.setString(4,Gender);
		memstmt.setInt(5,Age);
		memstmt.executeUpdate();
	
		ResultSet rs = memstmt.getGeneratedKeys();
		int lastKey = 0;
			if(rs.next()){
				lastKey = rs.getInt(1);
				
			}
			System.out.println(lastKey);
		String sql2 = "INSERT INTO address(member_no, member_address) VALUES(?,?)";
		Addstmt = conn.prepareStatement(sql2);
		Addstmt.setInt(1,lastKey);
		Addstmt.setString(2,Add);
		Addstmt.executeUpdate();
		conn.commit();
				
 }catch(Exception e){
		 	conn.rollback();
			e.printStackTrace(); 
	}finally{
		// 6. 사용한 Statement 종료
		if (memstmt != null) try { memstmt.close(); } catch(SQLException ex) {}
		if (Addstmt != null) try { Addstmt.close(); } catch(SQLException ex) {}
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}  
%>
</body>
</html>