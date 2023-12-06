<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String productId = request.getParameter("productId");   //사원번호(id) 데이터
   String name = request.getParameter("name");
   String unitprice = request.getParameter("unitprice");
   String description = request.getParameter("description");
   String manufacturer = request.getParameter("manufacturer");
   String category = request.getParameter("category");
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
   String unitsInstock = request.getParameter("unitsInstock");
   String condition = request.getParameter("condition");
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update product1018 set name=?, unitprice=?, description=?, manufacturer=?, category=?, unitsInstock=?, condition=? where productId=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(8, productId);    
      pstmt.setString(1, name);  
      pstmt.setString(2, unitprice);
      pstmt.setString(3, description);
      pstmt.setString(4, manufacturer);
      pstmt.setString(5, category); 
      pstmt.setString(6, unitsInstock); 
      pstmt.setString(7, condition); 
      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="productSelect.jsp";
      </script>
      <%
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
   
%>

</body>
</html>