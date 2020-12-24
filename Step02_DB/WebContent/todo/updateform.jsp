<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정할 할일 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//수정할 할일 정보를 DB 로 부터 얻어온다.
	TodoDto dto=TodoDao.getInstance().getData(num);
	//수정 폼을 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>할일 수정 폼 입니다.</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<label for="num">번호</label>
		<input type="text" id="num" value="<%=dto.getNum() %>" disabled/><br/>
		<label for="content">할일</label>
		<input type="text" name="content" id="content" value="<%=dto.getContent()%>"/><br/>
		<label for="regdate">등록일</label>
		<input type="text" id="regdate" value="<%=dto.getRegdate() %>" disabled/><br/>
		<button type="submit">수정 확인</button>
		<button type="reset">취소</button>
	</form>
</div>
</body>
</html>





