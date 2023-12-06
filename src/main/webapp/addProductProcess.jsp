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
   String productId = request.getParameter("productId");   //상품코드id 데이터
   String name = request.getParameter("name");
   String unitprice = request.getParameter("unitprice");
   String description = request.getParameter("description");
   String manufacturer = request.getParameter("manufacturer");
   String category = request.getParameter("category");
   String unitsInstock = request.getParameter("unitsInstock");
   String condition = request.getParameter("condition");
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into product1018 values(?,?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, productId);    //첫번째 물음표에 id가 넘어감
      pstmt.setString(2, name);         //두번째 물음표에 name이 넘어감
      pstmt.setString(3, unitprice);
      pstmt.setString(4, description);
      pstmt.setString(6, manufacturer);
      pstmt.setString(5, category); 
      pstmt.setString(7, unitsInstock); 
      pstmt.setString(8, condition); 
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("저장 완료되었습니다");
      location.href="productSelect.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
    %>

</body>
</html>