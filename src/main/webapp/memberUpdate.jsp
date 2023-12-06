<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.id.value==""){
		alert("아이디를 입력하세요");
		document.frm.id.focus(); //커서가 id에 그대로 남아있도록 
		return false;            //id를 입력하지 않으면 진행불가
	}
	if(document.frm.name.value==""){
		alert("이름을 입력하세요");
		document.frm.name.focus();
		return false;  
	}
	if(document.frm.password.value==""){
		alert("비밀번호를 입력하세요");
		document.frm.password.focus(); 
		return false;  
	}
	if(document.frm.confirmPw.value==""){
		alert("확인 비밀번호를 입력하세요");
		document.frm.confirmPw.focus(); 
		return false;  
	}
	if(document.frm.password.value!=document.frm.confirmPw.value){
		alert("비밀번호가 일치하지 않습니다");
		document.frm.password.focus(); 
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
<%@ include file = "dbconn.jsp" %>
<%
   ResultSet rs=null;
   PreparedStatement pstmt=null;
   String id = request.getParameter("id");
   
   try{
	   String sql="select * from member1018 where id=?"; //getParameter("id");
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, id);
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String name = rs.getString("name");
	       String pass = rs.getString("password");
	       String gender = rs.getString("gender");
	       String email = rs.getString("email");
	       String em[] = email.split("@");
	       String email1 = em[0];
	       String email2 = em[1];
	       String phone = rs.getString("phone"); //010-1111-2222
	       String ph[] = phone.split("-");
	       String phone1 = ph[0];
	       String phone2 = ph[1];
	       String phone3 = ph[2];
	       String address = rs.getString("address");
   
%>

<h1>회원 가입 수정 화면</h1>

<form name="frm" method="post" action="memberUpdateProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>아이디</th>
      <td><input type="text" name="id" id=in value="<%=id %>"></td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="name" id=in value="<%=name %>"></td>
</tr>

<tr> 
      <th>비밀번호</th>
      <td><input type="text" name="password" id=in1 value="<%=pass %>"></td>
</tr>

<tr> 
      <th>비밀번호 확인</th>
      <td><input type="text" name="confirmPw" id=in1 value="<%=pass %>"></td>
</tr>

<tr> 
      <th>성별</th>
      <td>
         <input type="Radio" name="gender" value="남성" onclick="getGender()" <%=gender.equals("남성") ?"checked":"" %>>남성
         <input type="Radio" name="gender" value="여성" onclick="getGender()" <%=gender.equals("여성") ?"checked":"" %>>여성
      </td>
</tr>

<tr> 
      <th>이메일</th>
    <td>
      <input type="text" name="email1" id=in placeholder="이메일" value="<%=email1 %>">
      @
      <select name = "email2" id=in2>
      <option value ="naver.com" <% if(email2.equals("naver.com")){%>selected <%} %> > naver.com</option>
      <option value ="daum.net" <% if(email2.equals("daum.net")){%>selected <%} %>> daum.net</option>
      <option value ="nate.com" <% if(email2.equals("nate.com")){%>selected <%} %>> nate.com</option>
      <option value ="hotmail.com" <% if(email2.equals("hotmail.com")){%>selected <%} %>> hotmail.com</option>
      <option value ="gmail.com" <% if(email2.equals("gmail.com")){%>selected <%} %>> gmail.com</option>
      </select>
    </td>
</tr>
 
<tr> 
      <th>연락처</th>
      <td>
    
      <select name ="phone1" id=in2 value="<%=phone1 %>">
      <option value ="010" selected> 010</option>
      </select>
      -
        <input type="text" name="phone2" id=in value="<%=phone2 %>">
        -
          <input type="text" name="phone3" id=in value="<%=phone3 %>">
    </td>
</tr>

<tr> 
      <th>주소</th>
      <td><input type="text" name="address" id=in3 value="<%=address %>"></td>
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
   }catch(Exception e) {
	   System.out.println("읽기 오류 : " +e.getMessage());

   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>