<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String itemName = request.getParameter("itemName");
	int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
	int itemRate = Integer.parseInt(request.getParameter("itemRate"));
	
	
	
	System.out.println(itemName+"<--itemName");
	System.out.println(itemPrice+"<--itemPrice");
	System.out.println(itemRate+"<--itemRate");
	
	
 	Connection conn = null;
 	PreparedStatement memstmt = null;
 
 	
 try{ 
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPw = "java0000";
		
		Class.forName(driver);
	
		conn = DriverManager.getConnection(url, dbUser, dbPw);
	
		conn.setAutoCommit(false);
		String sql1 = "insert into item( item_name, item_price, item_rate) values(?,?,?)"; 
		memstmt = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
		memstmt.setString(1,itemName);
		memstmt.setInt(2,itemPrice);
		memstmt.setInt(3,itemRate);
		memstmt.executeUpdate();
		ResultSet rs = memstmt.getGeneratedKeys();
		int lastKey = 0;
			if(rs.next()){
				lastKey = rs.getInt(1);
				
			}
			System.out.println(lastKey);
 }catch(Exception e){
	 	conn.rollback();
		e.printStackTrace(); 
			
 }finally{
		// 6. 사용한 Statement 종료
		if (memstmt != null) try { memstmt.close(); } catch(SQLException ex) {}
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}  
%>
</body>
</html>