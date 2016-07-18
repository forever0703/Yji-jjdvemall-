<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			 if($('#memberId').val()=="" || $('#memberId').val().length<4){
				$('#Idhelper').text("아이디를 입력하세요");
				$('#memberId').focus();
			}else if($('#memberPw').val()==""){
				$("#Idhelper").text("");
				$("#Pwhelper").text("비밀번호를 입력하세요");
				$('#memberPw').focus();
			}else if($('#memberName').val()==""){
				$('#Pwhelper').text("");
				$("#Namehelper").text("이름을 입력하세요");
				$('#memberName').focus();
			}else if($('.Gender:checked').length == 0){
				$('#Namehelper').text("");
				$("#Genhelper").text("성별을 입력하세요");
				$('.Gender:checked').focus();
			}else if($('#memberAge').val()==""){
				$("#Genhelper").text("");
				$("#Agehelper").text("나이를 입력하세요");
				$('#memberAge').focus();
			}else if($('#memberAddress').val()==""){
				$('#Agehelper').text("");
				$("#Addhelper").text("주소를 입력하세요");
				$('#memberAddress').focus();
			}else{
				$("#Addhelper").text("");
				$('#addform').submit();
			} 
			
		});
	});
</script>
</head>
<body>

	<h1>회원가입</h1>
<form id="addform" action="<%=request.getContextPath() %>/member/memberAddAction.jsp" method="post">
	
	<!-- <div>
		<label>number:</label>
			<input id="no" name="no" type="text" >
		
	<div> -->
	<div>
		<label>아이디:</label>
			<input id="memberId" name="memberId" type="text">
			<span id="Idhelper"></span>	
	</div>
	<div>
		<label>비밀번호:</label>
			<input id="memberPw" name="memberPw" type="password">
			<span id="Pwhelper"></span>
	</div>
	<div>
		<label>이름:</label>
			<input id="memberName" name="memberName" type="text" >
			<span id="Namehelper"></span>
	</div>
	<div>
		<label>성별:</label>
		<input class="Gender"  name="memberGender" type="radio" value="male" >남
		<input class="Gender"  name="memberGender" type="radio" value="female">여
		<span id="Genhelper"></span>
	</div>
	<div>
		<label>나이:</label>
			<input id="memberAge" name="memberAge" type="text">
			<span id="Agehelper"></span>
	</div>
	<div>
		<label>주소:</label>
			<input id="memberAddress" name="memberAddress" type="text">
			<span id="Addhelper"></span>
	</div>
	<div>
		<input id="addBtn" type="button" value="입력">
	</div>
</form>
</body>
</html>