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
	if(document.frm.address.value==""){
		alert("주소를 입력하세요");
		document.frm.address.focus();
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
<h1>회원 가입 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>
<form name="frm" method="post" action="addMemberProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>아이디</th>
      <td><input type="text" name="id" id=in></td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="name" id=in></td>
</tr>

<tr> 
      <th>비밀번호</th>
      <td><input type="text" name="password" id=in1></td>
</tr>

<tr> 
      <th>비밀번호 확인</th>
      <td><input type="text" name="confirmPw" id=in1></td>
</tr>

<tr> 
      <th>성별</th>
      <td>
         <input type="Radio" name="gender" value="남성" onclick="getGender()">남성
         <input type="Radio" name="gender" value="여성" onclick="getGender()">여성
      </td>
</tr>

<tr> 
      <th>이메일</th>
    <td>
      <input type="text" name="email1" id=in placeholder="이메일">
      @
      <select name = "email2" id=in2>
      <option value ="naver.com" selected> naver.com</option>
      <option value ="daum.net"> daum.net</option>
      <option value ="nate.com"> nate.com</option>
      <option value ="hotmail.com"> hotmail.com</option>
      <option value ="gmail.com"> gmail.com</option>
      </select>
    </td>
</tr>
 
<tr> 
      <th>연락처</th>
      <td>
    
      <select name ="phone1" id=in2>
      <option value ="010" selected> 010</option>
      </select>
      -
        <input type="text" name="phone2" id=in>
        -
          <input type="text" name="phone3" id=in>
    </td>
</tr>

<tr> 
      <th>주소</th>
      <td><input type="text" name="address" id=in3></td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>