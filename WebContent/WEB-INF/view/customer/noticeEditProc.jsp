<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //request.setCharacterEncoding("utf-8"); %>
<%
/* String title=request.getParameter("title");
String content=request.getParameter("content");
String seq=request.getParameter("c");

Notice n=new Notice();
n.setSeq(seq);
n.setTitle(title);
n.setContent(content);

NoticeDao dao=new NoticeDao();
int af=dao.update(n);

if(af>0)
	response.sendRedirect("noticeDetail.jsp?c="+seq);
else
	out.write("수정오류"); */
%>



<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp!</title>
</head>
<body>

</body>
</html>