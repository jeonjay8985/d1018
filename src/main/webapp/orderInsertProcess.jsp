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
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    conn.setAutoCommit(false); //트랜잭션 처리 위해 AutoCommit 중지
    
    String orderDate = request.getParameter("orderDate");
    String orderName = request.getParameter("orderName");
    String productId = request.getParameter("productId");
    String unitprice = request.getParameter("unitprice");
    String orderQty = request.getParameter("orderQty");
    String orderAddress = request.getParameter("orderAddress");
    
    try {
    	String sql = "insert into order1018 values(?,?,?,?,?,?)";
    	pstmt = conn.prepareStatement(sql);
    	pstmt.setString(1, orderDate);
    	pstmt.setString(2, orderName);
    	pstmt.setString(3, productId);
    	pstmt.setString(4, unitprice);
    	pstmt.setString(5, orderQty);
    	pstmt.setString(6, orderAddress);
    	pstmt.executeUpdate();
    	
    	//재고 마이너스, 상품코드를 읽어서 재고를 가져와 빼기해줌
    	
    	//int stock=0;
    	//sql="select unitsInstock from product0822 where productId=?";
    	
    	int stock=Integer.parseInt(orderQty);
    	sql="update product1018 set unitsInstock=unitsInstock - ? where productId=?"; 
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setInt(1, stock);   //stock을 데이터가 바로 인식하지 못해서 stock->?로 바꿈
    	pstmt.setString(2, productId);
    	pstmt.executeUpdate();    //db에 반영시켜주는 명령
    	
    	conn.commit();  //데이터처리시 에러가 없다면 commit 수행. 
    	                //마지막 update후 commit처리
    	               
    	%>
    	<script>
    	alert("주문정보 등록 성공");
    	location.href = "orderSelect.jsp";
    	</script>
    	<%

    }catch(Exception e) {
    	System.out.println("등록 오류:" +e.getMessage());
    	e.printStackTrace();
    	if(conn != null) //작업한게 있으면
    		try{
    			conn.rollback(); //에러발생시 rollback처리. insert/update하기전으로 되돌려줌
    		}catch(SQLException e1){}
    }finally{
    	try {
    		conn.setAutoCommit(true); //트랜잭션 처리를 기본상태로 되돌린다 (false->true)
    		
    		if(pstmt !=null) pstmt.close();
    		if(conn !=null) conn.close();
    	}catch(SQLException se) {}
    }
%>

</body>
</html>