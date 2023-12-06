<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {
	if(document.frm.productId.value==""){
		alert("상품코드를 입력하세요");
		document.frm.productId.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.name.value==""){
		alert("상품명을 입력하세요");
		document.frm.name.focus(); 
		return false; }
	
	if(document.frm.name.value.length<4 || document.frm.name.value.length>50){
		  alert("[상품명]\n 최소 4자에서 최대 50자까지 입력하세요");
		  document.frm.name.focus(); 
		  return false; 
		  }
	 	
	if(document.frm.unitprice.value==""){
		alert("가격을 입력하세요");
		document.frm.unitprice.focus(); 
		return false;  
	}
	if(document.frm.description.value==""){
		alert("상세정보를 입력하세요");
		document.frm.description.focus(); 
		return false;  
	}
	if(document.frm.manufacturer.value==""){
		alert("제조사를 입력하세요");
		document.frm.manufacturer.focus(); 
		return false;  
	}
	if(document.frm.unitsInstock.value==""){
		alert("재고수를 입력하세요");
		document.frm.unitsInstock.focus(); 
		return false;  
	}
	if(document.frm.condition.value==""){
		alert("상태를 선택하세요");
		document.frm.condition.focus(); 
		return false;  
	}
	
	
	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>상품 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>
<form name="frm" method="post" action="addProductProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>상품코드</th>
      <td><input type="text" name="productId" id=in1></td>
</tr>

<tr> 
      <th>상품명</th>
      <td><input type="text" name="name" id=in1></td>
</tr>

<tr> 
      <th>가격</th>
      <td><input type="text" name="unitprice" id=in1></td>
</tr>

<tr> 
      <th>상세정보</th>
      <td><input type="text" name="description" id=in1></td>
</tr>

<tr> 
      <th>제조사</th>
      <td><input type="text" name="manufacturer" id=in1></td>
</tr>

<tr> 
      <th>분류</th>
    <td>

      <select name = "category" id=in3>
      <option value ="10" selected> it 제품</option>
      <option value ="20"> 주방제품</option>
      <option value ="30"> 전자제품</option>
      <option value ="40"> 일반 잡화</option>
      </select>
    </td>
</tr>

<tr> 
      <th>재고수</th>
      <td><input type="text" name="unitsInstock" id=in1></td>
</tr>

<tr> 
      <th>상태</th>
      <td>
         <input type="Radio" name="condition" value="신규 제품" onclick="condition()">신규제품
         <input type="Radio" name="condition" value="중고 제품" onclick="condition()">중고제품
         <input type="Radio" name="condition" value="재생 제품" onclick="condition()">재생제품
      </td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>