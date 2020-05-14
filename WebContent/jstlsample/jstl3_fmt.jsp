<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp!</title>
</head>
<body>
<h3>jstl3.jsp</h3>
number: <fmt:formatNumber value="12345678" type="number" /> <br />
currency:<fmt:formatNumber value="12345678" type="currency" 
currencySymbol="￦" /> <br />
percent: <fmt:formatNumber value="12345678" type="percent" /> <br />
pettern=".0": <fmt:formatNumber value="12345678" pattern=".0" /> <br />

<c:set var="now" value="<%=new java.util.Date() %>" />
${now } <br />
date:<fmt:formatDate value="${now }" type="date" /> <br />
time:<fmt:formatDate value="${now }" type="time" /> <br />
both:<fmt:formatDate value="${now }" type="both" /> <br />



</body>
</html>