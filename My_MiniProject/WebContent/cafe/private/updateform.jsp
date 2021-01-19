<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 수정할 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. 글번호를 이용해서 수정할 글 정보를 DB에서 읽어온다.
	CafeDto dto=CafeDao.getInstance().getData(num);
	//3. 글 수정 폼을 응답한다.


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="cafe" name="thisPage"/>
</jsp:include>

<div class="container">
	<h1>글 수정 폼 입니다.</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<div class="form-group">
			<label>작성자</label>
			<input class="form-control"type="text" value="<%=dto.getWriter() %>" disabled />
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title" value="<%=dto.getTitle() %>" />
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<!-- textarea의 아이디는 반드시 content가 되어야 smarteditor 적용가능 -->
			<textarea class="form-control" name="content" id="content"><%=dto.getContent() %></textarea>
		</div>
		<!-- 클릭했을때 smarteditor의 submitContents(this)함수 실행되도록 설정 -->
		<button type="submit" onclick="submitContents(this);">수정확인</button>
		<button type="reset">취소</button>
	</form>
</div>
<jsp:include page="../../include/smarteditor.jsp"></jsp:include>
</body>
</html>