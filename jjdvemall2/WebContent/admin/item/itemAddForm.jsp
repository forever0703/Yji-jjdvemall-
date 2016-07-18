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
			 if($('#itemName').val()=="" || $('#memberId').val().length<4){
				$('#namehelper').text("상품을 입력하세요");
				$('#itemName').focus();
			}else if($('#itemPrice').val()==""){
				$("#namehelper").text("");
				$("#itemPricehelper").text("가격을 입력하세요");
				$('#itemPrice').focus();
			}else if($('#itemRate').val()==""){
				$('#itemPricehelper').text("");
				$("#itemRatehelper").text("할인 가격을 입력하세요");
				$('#itemRate').focus();
			}else{
				$("#itemRatehelper").text("");
				$('#addform').submit();
			} 
			
		});
	});
</script>
</head>
<body>
	<h1>상품등록</h1>
<form id="itemform" action="<%=request.getContextPath() %>/admin/item/itemAddAction.jsp" method="post">
	<div>
		<label>상품명:</label>
			<input id="itemName" name="name" type="text">
			<span id="namehelper"></span>	
	</div>
	<div>
		<label>가격:</label>
			<input id="itemPrice" name="price" type="text">
			<span id="itemPricehelper"></span>
	</div>
	<div>
		<label>할인률:</label>
			<input id="itemRate" name="rate" type="text" >
			<span id="itemRatehelper"></span>
	</div>
	<div>
		<input id="addBtn" type="button" value="입력">
	</div>
</form>
</body>
</html>