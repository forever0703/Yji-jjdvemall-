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
			 if($('#memberId').val()=="" || $('#memberId').val().length<4){
				$('#Idhelper').text("아이디를 입력하세요");
				$('#memberId').focus();
			}else if($('#memberPw').val()==""){
				$("#Idhelper").text("");
				$("#Pwhelper").text("비밀번호를 입력하세요");
				$('#memberPw').focus();
			}else{
				$("#Pwhelper").text("");
				$('#aform').submit();
			} 
			
		});
	});
</script>
<body>
<h1>회원 로그인</h1>
<form id="aform" action="<%=request.getContextPath() %>/member/loginAction.jsp" method="post">
	<div>
		<label>회원 아이디:</label>
		<input id="memberId" name="memberId" type="text">
		<span id="Idhelper"></span>
	</div>
	<div>
		<label>회원 비밀번호:</label>
		<input id="memberPw" name="memberPw" type="text">
		<span id="Pwhelper"></span>
	</div>
	<div>
		<input id="Btn" type="button" value="로그인">
	</div>
</form>
</body>
</html>