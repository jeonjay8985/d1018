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

<h1>회원 목록</h1>

<table border=1 id="tab1">
<tr>
    <th>아이디</th>
    <th>성명</th>
    <th>비밀번호</th>
    <th>성별</th>
    <th>이메일</th>
    <th>연락처</th>
    <th>주소</th>
    <th>구분</th>
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;

     try{
    	 String sql = "select id,name,password,gender,email,phone,address from member1018";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String id = rs.getString("id");
    		 String name = rs.getString("name");
    		 String password= rs.getString("password");
    		 String gender = rs.getString("gender");
    		 if(gender.equals("1")){
    			 gender="남성";
    		 }else if(gender.equals("2")){
    			 gender="여성";
    		 }
    		 String email = rs.getString("email");
    		 String phone = rs.getString("phone");
    		 String address = rs.getString("address");
%>

<tr>
    <td><%=id %> </td>
    <td><%=name %> </td>
    <td><%=password %> </td>
    <td><%=gender %> </td>
    <td><%=email %> </td>
    <td><%=phone %> </td>
    <td><%=address %> </td>

    <td>
     <a href="memberUpdate.jsp?id=<%=id %>"> 수정</a>/
    
     <a href="memberDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 11  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="addMember.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>