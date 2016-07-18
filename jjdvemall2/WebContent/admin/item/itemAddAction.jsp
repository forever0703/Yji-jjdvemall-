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
	/* int itemRate = Integer.parseInt(request.getParameter("itemRate")); */
	double itemRate = Double.parseDouble(request.getParameter("itemRate"));
	
	
	System.out.println(itemName+"<--itemName");
	System.out.println(itemPrice+"<--itemPrice");
	System.out.println(itemRate+"<--itemRate");
	
	
 	Connection conn = null;
 	PreparedStatement itemstmt = null;
 
 	
 try{ 
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPw = "java0000";
		
		Class.forName(driver);
	
		conn = DriverManager.getConnection(url, dbUser, dbPw);
	
		conn.setAutoCommit(false);
		String sql = "insert into item( item_name, item_price, item_rate) values(?,?,?)"; 
		itemstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		itemstmt.setString(1,itemName);
		itemstmt.setInt(2,itemPrice);
		itemstmt.setDouble(3,itemRate);
		itemstmt.executeUpdate();
		
		conn.commit();
 }catch(Exception e){
	 	conn.rollback();
		e.printStackTrace(); 
			
 }finally{
		// 6. 사용한 Statement 종료
		if (itemstmt != null) try { itemstmt.close(); } catch(SQLException ex) {}
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}  
%>
</body>
</html>