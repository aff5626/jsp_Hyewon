<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("utf-8");
%>
<%
	//데이터베이스에서 seq로 select 조건이 필요
	/* String seq=request.getParameter("c");
	NoticeDao dao=new NoticeDao();
	Notice n=dao.getNotice(seq);  */
%>


<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeDetail.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
	<h2>noticeDetail.jsp</h2>
	<table class="twidth">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<caption>Detail</caption>
		<tbody>
			<tr>
				<th class="left">글번호</th>
				<td>${n.seq }</td>
				<th class="left">조회수</th>
				<td>${n.hit }</td>
			</tr>
			<tr>
				<th class="left">작성자</th>
				<td>${n.writer }</td>
				<th class="left">작성시간</th>
				<td>${n.regdate }</td>
			</tr>
			<tr>
				<th class="left">제목</th>
				<td colspan="3">${n.title }</td>
			</tr>
			<tr>
				<th class="left">내용</th>
				<td colspan="3" id="content">${n.content }</td>
			</tr>
			<tr>
				<th class="left">첨부</th>
				<!-- 첨부파일 이름 불러오기 링크건 사이로 클릭할 문자 넣기 -->
				<td colspan="3" id="addfile">
					<!-- 파일의 경로 --> <a
					href="download.do?p=customer/upload/&f=${n.filesrc }">${n.filesrc }</a>

				</td>
			</tr>
		</tbody>
	</table>
	<div>
		<a href="noticeEdit.do?c=${n.seq }">수정</a> <a
			href="noticeDelProc.do?c=${n.seq }">삭제</a> <a href="notice.do">목록</a>
	</div>

	<div>
	<!-- 디테일칸 밑쪽에 이미지 나타나게 하기 -->
		<img style="width: 300px; height: 200px; border: 1px solid green; "
			src="upload/${n.filesrc }" alt="" />
	</div>

</body>
</html>

