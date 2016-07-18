<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style>
    table, tr, td {
        border:1px solid #000000 ;
        border-collapse:collapse;
    }
    table {
        width:100%;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addBtn').chlick(function(){
			/* if($('#memberId').val()=="" || $('#memberId').length<4){
				$('#memberIdhelper').text("아이디를 입력하세요");
				$('#memberId').focus();
			}else if($('#memberPw').val()==""){
				$("#memberIdhelper").text("");
				$("#memberPwhelper").text("비밀번호를 입력하세요");
				$('#memberPw').focus();
			}else if($('#memberName').val()==""){
				$('#memberPwhelper').text("");
				$("#memberNamehelper").text("이름을 입력하세요");
				$('#memberName').focus();
			}else{
				$("#memberNamehelper").text("");
				
			} */
			$('#addform').submit();
		});
	});

</script>
</head>
<body>
<fieldset>
	<legend>회원가입</legend>
<form id="addform" action="<%=request.getContextPath() %>/member/memberAddAction.jsp" method="post"></form>
	<table>
	<!-- <tr>
		<td>number:
			<input id="no" name="no" type="text" >
		</td>
	</tr> -->
	<tr>
		<td>아이디:
			<input id="memberId" name="memberId" type="text">
			<span id="memberIdhelper"></span>
		</td>
	</tr>
	<tr>
		<td>비밀번호:
			<input id="memberPw" name="memberPw" type="password">
			<span id="memberPwhelper"></span>
		</td>
	</tr>
	<tr>
		<td>이름:
			<input id="memberName" name="memberName" type="text" >
			<span id="memberNamehelper"></span>
		</td>
	</tr>
	<tr>
		<td>성별:
		<input id="male" name="memberGender" type="radio" value="male">남
		<input id="female" name="memberGender" type="radio" value="female">여
		</td>
	</tr>
	<tr>
		<td>나이:
			<input id="memberAge" name="memberAge" type="text">
			<span id="memberAgehelper"></span>
		</td>
	</tr>
	<tr>
		<td>주소:
			<input id="memberAddress" name="memberAddress" type="text">
			<span id="memberAddresshelper"></span>
		</td>
	</tr>
	<tr>
		<td>
			<input id="addBtn" type="button" value="입력">
		</td>
	</tr>
</table>
</fieldset>
</body>
</html>