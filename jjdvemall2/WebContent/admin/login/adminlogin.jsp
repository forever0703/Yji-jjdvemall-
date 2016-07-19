<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
		$('#Btn').click(function(){
			 if($('#adminId').val()=="" || $('#adminId').val().length<4){
				$('#Idhelper').text("아이디를 입력하세요");
				$('#adminId').focus();
			}else if($('#adminPw').val()==""){
				$("#Idhelper").text("");
				$("#Pwhelper").text("비밀번호를 입력하세요");
				$('#adminPw').focus();
			}else{
				$("#Pwhelper").text("");
				$('#maform').submit();
			} 
			
		});
	});
</script>
<body>
<h1>관리자 로그인</h1>
<form id="maform" action="<%=request.getContextPath() %>/admin/login/adminloginAction.jsp" method="post">
	<div>
		<label>관리자 아이디:</label>
		<input id="adminId" name="adminId" type="text">
		<span id="Idhelper"></span>
	</div>
	<div>
		<label>관리자 비밀번호:</label>
		<input id="adminPw" name="adminPw" type="text">
		<span id="Pwhelper"></span>
	</div>
	<div>
		<input id="Btn" type="button" value="로그인">
	</div>
</form>
</body>
</html>