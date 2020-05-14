<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
/* String seq=request.getParameter("c");

Notice n=new Notice();
NoticeDao dao=new NoticeDao();

int af=dao.delete(seq);

//어디로가라
if(af>0){//삭제성공
	response.sendRedirect("notice.jsp");
}else{
	out.write("삭제오류");
} */
%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp!</title>
</head>
<body>
<h2>noticeDelProc.jsp</h2>

</body>
</html>