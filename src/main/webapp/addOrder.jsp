<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function changesubmit()/*이벤트이름*/ {
    //alert("경고");
	document.frm.submit();//form이름 frm 
 }

function check() {
	if(document.frm.orderDate.value==""){
		alert("주문일자를 입력하세요");
		document.frm.orderDate.focus(); 
		return false;           
	}
	if(document.frm.orderName.value==""){
		alert("주문자이름을 입력하세요");
		document.frm.orderName.focus();
		return false;  
	}

	if(document.frm.productId.value==""){
		alert("상품코드를 입력하세요");
		document.frm.productId.focus(); 
		return false;  
	}
	if(document.frm.name.value==""){
		alert("상품명을 입력하세요");
		document.frm.name.focus(); 
		return false;  
	}
	if(document.frm.unitprice.value==""){
		alert("단가를 입력하세요");
		document.frm.unitprice.focus(); 
		return false;  
	}
	if(document.frm.orderQty.value==""){
		alert("주문수량을 입력하세요");
		document.frm.orderQty.focus(); 
		return false;  
	}
	if(document.frm.orderPrice.value==""){
		alert("주문금액을 입력하세요");
		document.frm.orderPrice.focus(); 
		return false;  
	}
	if(document.frm.orderAddress.value==""){
		alert("주문주소를 입력하세요");
		document.frm.orderAddress.focus(); 
		return false;  
	}
	
	frm.action="orderInsertProcess.jsp";

	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>주문정보 등록</h1>
<%@ include file = "dbconn.jsp" %>
<%
    ResultSet rs=null;
    PreparedStatement pstmt=null;
    String productId = request.getParameter("productId");
    
    String orderQty=request.getParameter("orderQty"); //폼에서 넘어오는거는 숫자더라도 문자취급(입력된 수량:문자)
    String orderDate=request.getParameter("orderDate"); //상품코드 읽으니까 칸이 사라짐 방지
    String orderName=request.getParameter("orderName"); //상품코드 입력시 칸 사라짐 방지
    
    String name = "";
    int uPrice=0;
    int oQty=0;
    
    if(orderDate == null) {
    	orderDate="";
    }
    
    if(orderName == null) {
    	orderName="";
    }
    
    if(orderQty == null) {
    	oQty=0;
    }
     else {
    	oQty=Integer.parseInt(orderQty); //문자orderQty를 숫자oQty로 변환
    }
    
    int stock=0;
    int total=0;
    
    if(productId == null) {
    	productId="";  //productId 초기화
    }else{
    
     try{
    	  String sql = "select name, unitprice, unitsInstock from product1018 where productId=?";
    	  pstmt=conn.prepareStatement(sql);
    	  pstmt.setString(1, productId);
    	  rs=pstmt.executeQuery();
    	  if(rs.next()){
    		  name = rs.getString(1);
    		  uPrice=rs.getInt(2);
    		  stock=rs.getInt(3);
    		  total=oQty*uPrice;
    		  if(oQty > stock) {
    			  %>
    			  <script>
    			  alert("주문수량이 재고수량보다 많습니다");
    			  history.back(-1);
    			  </script>
    			  <%
    		  }
    	  }else{
    		  %>
    		  <script>
    		  alert("등록되지 않은 상품코드입니다");
    		  </script>
    		  <%
        	  }
    	  }catch(Exception e) {
    	    System.out.println("에러" + e.getMessage());
        }
    }
 
 %>




<form name="frm" method="post" action="addOrder.jsp" method="post">
<table border=1 id="tab2">
<tr> 
      <th>주문일자</th>
      <td width=120px><input type="text" name="orderDate"  value="<%=orderDate %>" id=in1></td>
      <th>주문자 이름</th>
      <td><input type="text" name="orderName"  value="<%=orderName %>" id=in1></td>
</tr>

<tr> 
      <th>상품코드</th>
      <td width=120px><input type="text" name="productId" value="<%=productId %>" id=in1 onchange="changesubmit();"></td>
      <th>상품명</th>
      <td><input type="text" name="name" value="<%=name %>" id=in1></td>
</tr>

<tr> 
      <th>단가</th>
      <td width=120px><input type="text" name="unitprice" value="<%=uPrice %>"  id=in1 placeholder="0"></td>
       <th>주문수량</th>
      <td><input type="text" name="orderQty" id=in1 value="<%=oQty %>" onchange="changesubmit();"  placeholder="0"></td>
</tr>

<tr> 
      <th>주문금액</th>
      <td width=120px><input type="text" name="orderPrice" value="<%=total %>" id=in1 placeholder="0"></td>
      <th>주문주소</th>
      <td><input type="text" name="orderAddress" id=in1></td>
</tr>


<tr>
    <td colspan = 4 align = center>
    <input id=bt1 type="button" value="목록" onclick="check()"> 
    <input id=bt2 type="submit" value="저장" onclick="check()">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>


</body>
</html>