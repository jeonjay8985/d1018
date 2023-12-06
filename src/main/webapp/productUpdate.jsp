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
<h1>상품 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String productId = request.getParameter("productId"); //productUpdate.jsp?id의 id
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select * from product1018 where productId=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, productId); //String의 id랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String name = rs.getString("name");
		   String unitprice = rs.getString("unitprice");
		   String description = rs.getString("description");
		   String manufacturer = rs.getString("manufacturer");
		   String category = rs.getString("category"); 
			 if(category.equals("10")){
    			 category="it 제품";
    		 }else if(category.equals("20")){
    			 category="주방제품";
    		 }
    		 else if(category.equals("30")){
    			 category="전자제품";
    		 }
    		 else if(category.equals("40")){
    			 category="일반 잡화";
    		 }
		   String unitsInstock = rs.getString("unitsInstock");
		   String condition = rs.getString("condition");
		   
%>
<form name="frm" method="post" action="productUpdateProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>상품코드</th>
      <td><input type="text" name="productId" id=in1 value="<%=productId%>"></td>
</tr>
<tr> 
      <th>상품명</th>
      <td><input type="text" name="name" id=in1 value="<%=name%>"></td>
</tr>

<tr> 
      <th>가격</th>
      <td><input type="text" name="unitprice" id=in1 value="<%=unitprice%>"></td>
</tr>

<tr> 
      <th>상세정보</th>
      <td><input type="text" name="description" id=in1 value="<%=description%>"></td>
</tr>

<tr> 
      <th>제조사</th>
      <td><input type="text" name="manufacturer" id=in1 value="<%=manufacturer%>"></td>
</tr>
<tr> 
      <th>분류</th>
    <td>
      <select name = "category" id=in3>
      <option value ="10" <% if(category.equals("it 제품")){ %>selected <%}%>> it 제품</option>
      <option value ="20" <% if(category.equals("주방제품")){ %>selected <%}%>> 주방제품</option>
      <option value ="30" <% if(category.equals("전자제품")){ %>selected <%}%>> 전자제품</option>
      <option value ="40" <% if(category.equals("일반 잡화")){ %>selected <%}%>> 일반 잡화</option>
      </select>
    </td>
</tr>
<tr> 
      <th>재고수</th>
      <td><input type="text" name="unitsInstock" id=in1 value="<%=unitsInstock%>"></td>
</tr>

<tr> 
      <th>상태</th>
      <td>
         <input type="Radio" name="condition" value="신규 제품" <%=condition.equals("신규 제품") ? "checked" :""%>>신규 제품
         <input type="Radio" name="condition" value="중고 제품"<%=condition.equals("중고 제품") ? "checked" :""%>>중고 제품
         <input type="Radio" name="condition" value="재생 제품"<%=condition.equals("재생 제품") ? "checked" :""%>>재생 제품
      </td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
<%
	   }
    }catch(Exception e){
 	  System.out.println("수정 실패" +e.getMessage());
   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>