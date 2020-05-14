<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp!</title>
<link rel="stylesheet" href="../css/join.css" />
</head>
<body>
<h2>join.jsp</h2>
<h2>회원가입</h2>
<form action="joinProc.jsp">
	<p style="color:red;">
	<%
	if(request.getAttribute("errors")!=null){
		List<String> errors=(List)request.getAttribute("errors");
		for(int i=0;i<errors.size();i++){
	%>
		<%=errors.get(i) %> <br />		
	<%	
		}
	}
	%>
	
	</p>

	<label>아이디</label>
	<input type="text" name="id" />
	<input type="button" value="중복확인" />
	<br />
	<label>비밀번호</label>
	<input type="text" name="pwd" /> <br />
	<label>비번확인</label>
	<input type="text" name="pwd2" /> <br />
	<label>이름</label>
	<input type="text" name="name" /> <br />
	<label>성별</label>
	<select name="gender">
		<option value="남성">남성</option>
		<option value="여성">여성</option>
	</select> <br />
	<label>생년월일</label>
	<input type="text" name="year" size="5" />년
	<input type="text" name="month" size="5" />월
	<input type="text" name="day" size="5" />일
	
	<input type="radio" name="IsLunar" value="Solar" checked />양력
	<input type="radio" name="IsLunar" value="IsLunar"  />음력 <br />	
	
	<label>핸드폰번호</label>
	<input type="tel" name="cphone" /> 예)010-1111-5555 <br />
	<label>이메일</label>
	<input type="email" name="email" /> <br />
	<label>취미</label>
	<input type="checkbox" name="habit" value="music" /> 음악
	<input type="checkbox" name="habit" value="movie" /> 영화
	<input type="checkbox" name="habit" value="trip" /> 여행 <br />
	<input type="submit" value="확인" />

</form>
</body>
</html>