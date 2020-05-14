<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeReg.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />

</head>
<!-- 파일 첨부 라이브러리 찾으러 가기 
http://servlets.com/cos/>>cos-20.08.zip
인코딩 타입 변경multipart/form-data
-->
<body>
	${uid }
	<form action="noticeRegProc.do" method="post"
		enctype="multipart/form-data">
		<table class="twidth">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>Write</caption>
			<tbody>
				<tr>
					<th class="left">제목</th>
					<td colspan="3"><input class="inp" name="title" /></td>
				</tr>
				<tr>
					<th class="left">내용</th>
					<td colspan="3" id="content"><textarea class="txt"
							name="content"></textarea></td>
				</tr>
				<tr>
					<th class="left">첨부</th>
					<td colspan="3" id="addfile">
						<!-- 첨부 스타일 매기기 --> <input type="file" name="file" size="50"
						class="" />
					</td>
				</tr>
			</tbody>
		</table>
		<div>
			<input type="hidden" name="uid" value="${uid }" />
			<input type="submit" value="save" />
			<input type="button" value="cancel" class="cancel" />
	</form>

</body>
</html>