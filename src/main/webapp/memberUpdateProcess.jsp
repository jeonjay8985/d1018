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
      String sql = "update member1018 set name=?, password=?, gender=?, email=?, phone=?, address=? where id=?"; //노쉼표!! where id=? <-수정
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(7, id);    //update는 id가 젤 마지막
      pstmt.setString(1, name);  //여기서부터 1번
      pstmt.setString(2, password);
      pstmt.setString(3, gender);
      pstmt.setString(4, email); 
      pstmt.setString(5, phone); 
      pstmt.setString(6, address); 
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("수정이 완료되었습니다");
      location.href="memberSelect.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   %>
</body>
</html>