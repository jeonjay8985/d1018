<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<h1>주문 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>주문일자</th>
    <th>주문자 성명</th>
    <th>상품번호</th>
    <th>상품명</th>
    <th>단가</th>
    <th>주문수량</th>
    <th>주문자 주소</th>
    <th>구분</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
    int no =0;
     try{
    	 String sql = "select to_char(orderDate, 'yyyy-mm-dd'), a.orderName, a.productId, b.name, a.unitPrice, a.orderQty, a.orderAddress from order1018 a, product1018 b where a.productId=b.productId";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String orderDate = rs.getString(1);
    		 String orderName= rs.getString("orderName");
    		 String productId = rs.getString("productId");
    		 String name = rs.getString("name");
    		 String unitPrice = rs.getString("unitPrice");
    		 String orderQty = rs.getString("orderQty");
    		 String orderAddress = rs.getString("orderAddress");
    		 
    		 no++;
    		
%>
<tr>
    <td><%=no %> </td>
    <td><%=orderDate %> </td>
    <td><%=orderName %> </td>
    <td><%=productId %> </td>
    <td><%=name %> </td>
    <td><%=unitPrice %> </td>
    <td><%=orderQty %> </td>
    <td><%=orderAddress %> </td>
 

    <td>
     <a href="productUpdate.jsp?productId=<%=productId %>"> 수정</a>/
    
     <a href="productDelete.jsp?productId=<%=productId %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 9  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="addOrder.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>