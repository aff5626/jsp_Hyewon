<%@page import="notice.vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>

	<!-- uid가 empty이냐 아니냐 -->




	<c:if test="${empty sessionScope.uid }">
		<a href="../login/login.do">log in</a>
	</c:if>
	<c:if test="${not empty uid }">${uid } 님 입장하셨습니다</c:if>

	<c:if test="${not empty sessionScope.uid }">
		<a href="../login/logoutProc.do">log out</a>

	</c:if>

	<a href="join.do">join</a>


	<hr />



	<form action="notice.do" method="get">
		<input type="hidden" name="pg" value="1" /> <select name="f">
			<option ${param.f=="title"?"selected":"" } value="title">제목</option>
			<option ${param.f=="content"?"selected":"" } value="content">내용</option>
		</select> <input type="text" name="q" value="${query }" /> <input
			type="submit" value="검색" />
	</form>


	<table class="twidth">
		<colgroup>
			<col width="10%" />
			<col width="35%" />
			<col width="12%" />
			<col width="30%" />
			<col width="13%" />
		</colgroup>
		<caption>List</caption>
		<tbody>
			<tr>
				<th class="left">번호</th>
				<th class="left">제목</th>
				<th class="left">작성자</th>
				<th class="left">작성일</th>
				<th class="left">조회수</th>
			</tr>
			<%-- <%
	List<Notice> list=(List<Notice>)request.getAttribute("list");
	for(Notice n:list){
		pageContext.setAttribute("n", n);
	%> --%>
			<c:forEach items="${list }" var="n">
				<tr>
					<td>${n.seq }</td>
					<td><a href="noticeDetail.do?c=${n.seq }&h=${n.hit}">${n.title }</a></td>
					<td>${n.writer }</td>
					<td>${n.regdate }</td>
					<td>${n.hit }</td>
				</tr>
			</c:forEach>
			<%-- <%
	}	
	%> --%>
		</tbody>
	</table>

	<c:if test="${not empty sessionScope.uid }">
		<a href="noticeReg.do">Write</a>
	</c:if>



	<br />
	<c:if test="${start==1 }">
		<!-- 1페이지부터 나타난 내용이라면 나타낼 필요X -->
		<span>prev</span>
	</c:if>

	<c:if test="${start!=1 }">
		<!-- 해당 그룹의 처음 페이지로 돌아가는 기능(6페이지에서 5를 빼면 1페이지로 돌아감) -->
		<a
			href="notice.do?pg=${start-5 }&f=${param.f==null?'title':param.f}&q=${query}">prev</a>
	</c:if>

	<c:forEach var="i" begin="${start }" end="${start+4 }">
		<!-- 빈페이지 못나오게 제약 걸기 -->
		<c:if test="${i<=end }">
			<!-- 누르는 페이지 표시 -->
			<c:if test="${i==page }">
				<strong style="color: red;"> <a
					href="notice.do?pg=${i }&f=${param.f==null?'title':param.f}&q=${query}">${i }</a>
				</strong>
			</c:if>
			<!-- else if -->
			<c:if test="${i!=page }">
				<a
					href="notice.do?pg=${i }&f=${param.f==null?'title':param.f}&q=${query}">${i }</a>
			</c:if>
		</c:if>
	</c:forEach>

	<c:if test="${start+4>=end }">
		<!-- 스타트 페이지에서 4를 더했을때 end보다 크면 링크 걸지 않기 -->
		<span>next</span>
	</c:if>

	<c:if test="${start+4<end }">
		<!-- 페이지의 갯수 5개 늘려주기 -->
		<a
			href="notice.do?pg=${start+5 }&f=${param.f==null?'title':param.f}&q=${query}">next</a>
	</c:if>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<!-- 내가 보고있는 페이지가 총 페이지 중 몇번째인지 출력 -->
	<span>${page }/${end }</span>page


</body>
</html>
