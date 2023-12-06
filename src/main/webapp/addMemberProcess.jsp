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
   String id = request.getParameter("id");   //사원번호(id) 데이터
   String name = request.getParameter("name");
   String password = request.getParameter("password");
   String gender = request.getParameter("gender");
   String email = request.getParameter("email1")+"@"+request.getParameter("email2");
   String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
   String address = request.getParameter("address");
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into member1018 values(?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);    //첫번째 물음표에 id가 넘어감
      pstmt.setString(2, name);  //두번째 물음표에 name이 넘어감
      pstmt.setString(3, password);
      pstmt.setString(4, gender);
      pstmt.setString(5, email); 
      pstmt.setString(6, phone); 
      pstmt.setString(7, address); 
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("저장성공");
      location.href="memberSelect.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   %>
</body>
</html>